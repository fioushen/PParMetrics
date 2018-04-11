#ifndef PPAR_DEPENDENCE_GRAPH_IMPL_H
#define PPAR_DEPENDENCE_GRAPH_IMPL_H

#include "ppar_common_includes.h"

#include <memory>
#include <stack>

namespace ppar {

template <typename NODE, typename EDGE>
Graph<NODE,EDGE>::Graph() {

    Root = InvalidNode; 
    
    Nodes.clear();
    Edges.clear();
    Succs.clear();
    Preds.clear();

    DFS_data_valid = false;
    DFS_order.clear();
    DFS_properties.clear();

    SCCs_data_valid = false;
    SCCs.clear();
}

template <typename NODE, typename EDGE>
Graph<NODE,EDGE>::~Graph() {

    for (auto edge_it = Edges.begin(); edge_it != Edges.end(); edge_it++) {
        edge_set& EdgeSet = edge_it->second;
        for (auto& edge : EdgeSet) {
            if (edge.Data != nullptr) {
                delete edge.Data;
            }
        }
    }

    Nodes.clear();
    Edges.clear();
    Succs.clear();
    Preds.clear();

    DFS_data_valid = false;
    DFS_order.clear();
    DFS_properties.clear();
}

template <typename NODE, typename EDGE>
GraphNode<NODE,EDGE> Graph<NODE,EDGE>::InvalidNode = GraphNode<NODE,EDGE>();

template <typename NODE, typename EDGE>
typename Graph<NODE,EDGE>::dfs_iterator Graph<NODE,EDGE>::dfs_begin(DFS_callback<NODE,EDGE>* DFSCallback) {
    if (!DFS_data_valid) {
        dfsTraverse();
    }
    return DFS_order.begin();
}
        
template <typename NODE, typename EDGE>
typename Graph<NODE,EDGE>::dfs_iterator Graph<NODE,EDGE>::dfs_end(DFS_callback<NODE,EDGE>* DFSCallback) {
    if (!DFS_data_valid) {
        dfsTraverse();
    }
    return DFS_order.end(); 
}

template <typename NODE, typename EDGE>
void Graph<NODE,EDGE>::addNode(const NODE Node) {
    Nodes.insert(GraphNode<NODE,EDGE>(Node));
}
        
template <typename NODE, typename EDGE>
void Graph<NODE,EDGE>::addEdge(const NODE From, const NODE To, const EDGE Data) {
    const GraphNode<NODE,EDGE>& FromNode = nodeExists(From);
    const GraphNode<NODE,EDGE>& ToNode = nodeExists(To);

    if ( (FromNode != InvalidNode) &&
         (ToNode != InvalidNode) ) {
        Edges[std::make_pair(From,To)].insert(GraphEdge<NODE,EDGE>(From, To, Data));
        addPredecessor(ToNode, FromNode);
        addSuccessor(FromNode, ToNode);
    } else {
        // cannot insert and edge between non-existent nodes
        llvm_unreachable("Cannot add an edge between non-existent nodes");
    }
}

template <typename NODE, typename EDGE>
const GraphNode<NODE,EDGE>& Graph<NODE,EDGE>::nodeExists(const NODE Node) const {
    const_node_iterator node_it = Nodes.find(GraphNode<NODE,EDGE>(Node)); 
    if (node_it != Nodes.end()) {
        return *node_it;
    } else {
        return Graph<NODE,EDGE>::InvalidNode;
    }
}

template <typename NODE, typename EDGE>
void Graph<NODE,EDGE>::addPredecessor(const GraphNode<NODE,EDGE>& Node, const GraphNode<NODE,EDGE>& Pred) {
    Preds[GraphNode<NODE,EDGE>(Node)].insert(GraphNode<NODE,EDGE>(Pred));
}

template <typename NODE, typename EDGE>
void Graph<NODE,EDGE>::addSuccessor(const GraphNode<NODE,EDGE>& Node, const GraphNode<NODE,EDGE>& Succ) {
    Succs[GraphNode<NODE,EDGE>(Node)].insert(GraphNode<NODE,EDGE>(Succ));
} 

template <typename NODE, typename EDGE>
void Graph<NODE,EDGE>::dfsTraverse(DFS_callback<NODE,EDGE>* VisitorFunc) const {
    // SearchSet - is the set of all not yet discovered nodes (whites)
    // (initially equal to the set of all graph nodes - Nodes
    node_set SearchSet(Nodes);
    // Stack - is used for the iterative DFS algorithm
    std::stack<GraphNode<NODE,EDGE>> Stack;
    // CurrentTime - DFS tracks traversal time 
    uint64_t CurrentTime = 0;
  
    DEBUG(
        llvm::dbgs() << "[[" << CurrentTime << "] new DFS traversal]\n";
    );

    DFS_properties.clear();
    for (const_node_iterator node_it = Nodes.cbegin(); node_it != Nodes.cend(); node_it++) {
        DFS_properties[*node_it] = std::make_unique<DFS_node_properties>();
    }
 
    while (!SearchSet.empty()) { // we still have undiscovered (white) nodes
        Stack.push(*SearchSet.begin());

        DEBUG(
            std::string str;
            llvm::raw_string_ostream rso(str);
            ((SearchSet.begin())->getNode())->print(rso);
            llvm::dbgs() << "[[" << CurrentTime << "] new DFS tree: root(" << str << ")]\n";
        );

        while (!Stack.empty()) {
            bool NodeIsProcessed = true; // we are done with the node and all its successors
            GraphNode<NODE,EDGE> CurrentNode(Stack.top());
            DFS_node_properties* Node_props = DFS_properties[CurrentNode].get();

            DEBUG(
                std::string str;
                llvm::raw_string_ostream rso(str);
                (CurrentNode.getNode())->print(rso);

                if (Node_props->Color == DFS_node_properties::NodeColor::WHITE) {
                    llvm::dbgs() << "[" << CurrentTime << "] taking the node off the stack: WHITE " << str << "\n";
                } else if (Node_props->Color == DFS_node_properties::NodeColor::GREY) {
                    llvm::dbgs() << "[" << CurrentTime << "] taking the node off the stack: GREY " << str << "\n";
                } else {
                    llvm::dbgs() << "[" << CurrentTime << "] taking the node off the stack: BLACK " << str << "\n";
                }
            );

            if (Node_props->Color == DFS_node_properties::NodeColor::WHITE) {
                Node_props->Color = DFS_node_properties::NodeColor::GREY;
                DFS_properties[CurrentNode]->TimestampEntry = CurrentTime;
                SearchSet.erase(CurrentNode); // node is discovered
                if ( VisitorFunc != nullptr &&
                     (VisitorFunc->CallOrder == DFS_callback<NODE,EDGE>::Order::PRE) ) {
                    VisitorFunc->operator()();
                }

                DEBUG(
                    std::string str;
                    llvm::raw_string_ostream rso(str);
                    (CurrentNode.getNode())->print(rso);
                    llvm::dbgs() << "[" << CurrentTime << "] discovered new node WHITE->GREY: " << str << "\n";
                );
            }

            const auto it = Succs.find(CurrentNode);
            if (it != Succs.end()) {
                const Graph<NODE,EDGE>::unordered_node_set& Successors = Succs.at(CurrentNode);
                for (typename unordered_node_set::const_iterator succ_it = Successors.cbegin(); succ_it != Successors.cend(); succ_it++) {
                    // mark edge with the corresponding edge type
                    const edge_set& EdgesSet = Edges.at(std::make_pair(CurrentNode.Node, succ_it->Node));
                    if (EdgesSet.empty()) {
                        llvm_unreachable("Inconsistent dependence graph data structure: edge does not exist");
                    }
                    typename GraphEdge<NODE,EDGE>::EdgeType Type;
                    DFS_node_properties::NodeColor SuccNodeColor = DFS_properties[GraphNode<NODE,EDGE>(*succ_it)]->Color;
                    if (SuccNodeColor == DFS_node_properties::NodeColor::WHITE) {
                        // successor has not been discovered yet ->
                        // hence the node is not yet completely processed
                        NodeIsProcessed = false;
                        Stack.push(GraphNode<NODE,EDGE>(*succ_it));
                        // since this successor hasn't been visited yet, 
                        // we mark corresponding edge as of tree edge type
                        Type = GraphEdge<NODE,EDGE>::EdgeType::TREE;
        
                        DEBUG(
                            std::string str;
                            llvm::raw_string_ostream rso(str);
                            ((*succ_it).getNode())->print(rso);
                            llvm::dbgs() << "[" << CurrentTime << "] found successor: WHITE " << str << "\n";
                        );

                    } else if (SuccNodeColor == DFS_node_properties::NodeColor::GREY) {
                        Type = GraphEdge<NODE,EDGE>::EdgeType::BACK;

                        DEBUG(
                            std::string str;
                            llvm::raw_string_ostream rso(str);
                            ((*succ_it).getNode())->print(rso);
                            llvm::dbgs() << "[" << CurrentTime << "] found successor: GREY " << str << "\n";
                        );

                    } else { // BLACK
                        if (DFS_properties[CurrentNode]->TimestampEntry < CurrentTime) {
                            Type = GraphEdge<NODE,EDGE>::EdgeType::FORWARD;
                        } else {
                            Type = GraphEdge<NODE,EDGE>::EdgeType::CROSS;
                        }

                        DEBUG(
                            std::string str;
                            llvm::raw_string_ostream rso(str);
                            ((*succ_it).getNode())->print(rso);
                            llvm::dbgs() << "[" << CurrentTime << "] found successor: BLACK " << str << "\n";
                        );

                    }
                    for (auto& edge : EdgesSet) {
                        edge.Type = Type;
                    }
                }
            } else {
                DEBUG(
                    std::string str;
                    llvm::raw_string_ostream rso(str);
                    (CurrentNode.getNode())->print(rso);
                    llvm::dbgs() << "node has no successors: " << str << "\n";
                );
            }

            if (NodeIsProcessed) {
                // we won't ever return to it in the current traversal
                Stack.pop();
                DFS_order.push_back(CurrentNode);
                DFS_properties[CurrentNode]->TimestampExit = CurrentTime;
                DFS_properties[CurrentNode]->Color = DFS_node_properties::NodeColor::BLACK;
                if ( VisitorFunc != nullptr &&
                     (VisitorFunc->CallOrder == DFS_callback<NODE,EDGE>::Order::POST)) {
                    VisitorFunc->operator()();
                }

                DEBUG(
                    std::string str;
                    llvm::raw_string_ostream rso(str);
                    (CurrentNode.getNode())->print(rso);
                    llvm::dbgs() << "[" << CurrentTime << "] node is processed: -> BLACK " << str << "\n";
                );

            }
            
            CurrentTime++;
        }
    }

    DFS_data_valid = true;
}

template <typename NODE, typename EDGE>
void Graph<NODE,EDGE>::findSCCs() const {
    // SearchSet - is the set of all not yet discovered (white) nodes;
    // the set must be ordered by the finishing time of the node in the DFS traversal
    auto cmp_func = [this] (const GraphNode<NODE,EDGE>& NodeA, const GraphNode<NODE,EDGE>& NodeB) -> bool {
        uint64_t NodeA_finishing_time = this->DFS_properties[NodeA]->TimestampExit;
        uint64_t NodeB_finishing_time = this->DFS_properties[NodeB]->TimestampExit;
        
        if (NodeA_finishing_time > NodeB_finishing_time) {
            return true;
        } else {
            return false;
        }
    };
    std::set<GraphNode<NODE,EDGE>,std::function<bool(const GraphNode<NODE,EDGE>&,const GraphNode<NODE,EDGE>&)>> SearchSet(cmp_func);
    // Stack - is used for the iterative DFS algorithm
    std::stack<GraphNode<NODE,EDGE>> Stack;

    SCCs_data_valid = false;

    // compute finishing times of nodes in DFS traversal
    if (!DFS_data_valid) {
        dfsTraverse();
    }
    
    // fill the SearchSet with finishing time ordered nodes
    for (const auto& Node : Nodes) {
        SearchSet.insert(GraphNode<NODE,EDGE>(Node));
    }
   
    for (const_node_iterator node_it = Nodes.cbegin(); node_it != Nodes.cend(); node_it++) {
        DFS_properties[*node_it]->Color = DFS_node_properties::NodeColor::WHITE;
    }

    while (!SearchSet.empty()) { // we still have undiscovered (white) nodes
        GraphNode<NODE,EDGE> SCC_root = *(SearchSet.begin()); // take the next node (in finishing time descending order)
        Graph<NODE,EDGE>* CurrentSCC = new Graph<NODE,EDGE>();
        CurrentSCC->setRoot(SCC_root.getNode());
        SCCs[SCC_root] = CurrentSCC;
        Stack.push(GraphNode<NODE,EDGE>(SCC_root));
        // start to form a new tree in a DFS forest (start to build a new Strongly Connected Component)
        while (!Stack.empty()) {
            GraphNode<NODE,EDGE> CurrentNode(Stack.top());
            Stack.pop();

            CurrentSCC->addNode(CurrentNode.getNode());
/*            const auto preds_it = Preds.find(CurrentNode);
            if (preds_it != Preds.end()) {
                const Graph<NODE,EDGE>::unordered_node_set& Predecessors = Preds.at(CurrentNode);
                for (typename unordered_node_set::const_iterator pred_it = Predecessors.cbegin(); pred_it != Predecessors.cend(); pred_it++) {
                    // mark edge with the corresponding edge type
                    const edge_set& EdgesSet = Edges.at(std::make_pair(CurrentNode.Node, pred_it->Node));
                    if (EdgesSet.empty()) {
                        llvm_unreachable("Inconsistent dependence graph data structure: edge does not exist");
                    } else {
                        for (auto& Edge : EdgesSet) {
                            ppar::Dependence* Dep = new ppar::Dependence();
                            *Dep = *(Edge.getData());
                            CurrentSCC->addEdge(pred_it->getNode(), CurrentNode.getNode(), Dep);
                        }
                    }
                }
            }
            const auto succs_it = Succs.find(CurrentNode);
            if (succs_it != Succs.end()) {
                const Graph<NODE,EDGE>::unordered_node_set& Successors = Succs.at(CurrentNode);
                for (typename unordered_node_set::const_iterator succ_it = Successors.cbegin(); succ_it != Successors.cend(); succ_it++) {
                    // mark edge with the corresponding edge type
                    const edge_set& EdgesSet = Edges.at(std::make_pair(CurrentNode.Node, succ_it->Node));
                    if (EdgesSet.empty()) {
                        llvm_unreachable("Inconsistent dependence graph data structure: edge does not exist");
                    } else {
                        for (auto& Edge : EdgesSet) {
                            ppar::Dependence* Dep = new ppar::Dependence();
                            *Dep = *(Edge.getData());
                            CurrentSCC->addEdge(CurrentNode.getNode(), succ_it->getNode(), Dep);
                        }
                    }
                }
            }*/
            
            DFS_node_properties* Node_props = DFS_properties[CurrentNode].get();

            if (Node_props->Color == DFS_node_properties::NodeColor::WHITE) {
                Node_props->Color = DFS_node_properties::NodeColor::BLACK;
                SearchSet.erase(CurrentNode); // node is discovered
            }
            // walk along all outgoing edges of the node
            // (on the reverse to the current graph)
            const auto it = Preds.find(CurrentNode);
            if (it != Preds.end()) {
                const Graph<NODE,EDGE>::unordered_node_set& Successors = Preds.at(CurrentNode); // Preds in the graph are Succs in its reverse
                for (typename unordered_node_set::const_iterator succ_it = Successors.cbegin(); succ_it != Successors.cend(); succ_it++) {
                    DFS_node_properties::NodeColor SuccNodeColor = DFS_properties[GraphNode<NODE,EDGE>(*succ_it)]->Color;
                    if (SuccNodeColor == DFS_node_properties::NodeColor::WHITE) {
                        Stack.push(GraphNode<NODE,EDGE>(*succ_it));
                    }
                }
            }
        }
    }

    SCCs_data_valid = true;
}

template <typename NODE, typename EDGE>
const typename Graph<NODE,EDGE>::unordered_node_set& ppar::Graph<NODE,EDGE>::getDependants(const NODE Node) const {
    return Succs[GraphNode<NODE,EDGE>(Node)];
}

} // namespace ppar

#endif // #ifndef PPAR_DEPENDENCE_GRAPH_IMPL_H
#ifndef PPAR_GRAPH_PASS_IMPL_H
#define PPAR_GRAPH_PASS_IMPL_H

#include "GraphPass.h"

#define RegisterGraphPass(NODE,EDGE,PASS,VAR) \
\
RegisterPass<ppar::GraphPass<NODE,EDGE,PASS>> \
VAR( PASS::getGraphPassOption(),\
     PASS::getGraphPassOptionDesc() );

namespace ppar {

template <typename NODE, typename EDGE, typename PASS>
GraphPass<NODE*,EDGE*,PASS>::GraphPass() 
 : FunctionPass(ID) {
    DEBUG_WITH_TYPE("ppar-pass-pipeline",
        dbgs() << "GraphPass::GraphPass()\n";
    );
}

template <typename NODE, typename EDGE, typename PASS>
Graph<NODE*,EDGE*> GraphPass<NODE*,EDGE*,PASS>::InvalidGraph;

template <typename NODE, typename EDGE, typename PASS>
void GraphPass<NODE*,EDGE*,PASS>::releaseMemory() {
    DEBUG_WITH_TYPE("ppar-pass-pipeline",
        dbgs() << "GraphPass::releaseMemory()\n";
    );

    LG.clear();
}

template <typename NODE, typename EDGE, typename PASS>
Graph<NODE*,EDGE*>& GraphPass<NODE*,EDGE*,PASS>::getFunctionGraph() { return *G; }

template <typename NODE, typename EDGE, typename PASS>
Graph<NODE*,EDGE*>& GraphPass<NODE*,EDGE*,PASS>::getLoopGraph(const Loop* L) { 
    auto it = LG.find(L);
    if (it != LG.end()) {
        return *((it->second).get());
    } else {
        return InvalidGraph;
    }
}

template <typename NODE, typename EDGE, typename PASS>
void GraphPass<NODE*,EDGE*,PASS>::allocateGraphs(llvm::Function& F) {
    
    DEBUG_WITH_TYPE("ppar-pass-pipeline",
        dbgs() << "GraphPass::allocateGraphs()\n";
    );
    
    // allocate function's dependence graph
    G = std::make_unique<Graph<NODE*,EDGE*>>(this, &F); 
    // if we've got any loops in the function, then proceed with dependence graph allocation for them 
    ppar::FunctionLoopInfoPass& LInfoPass = (getAnalysis<FunctionLoopInfoPass>());
    const FunctionLoopInfoPass::FunctionLoopList* LList = LInfoPass.getFunctionLoopList(&F);
    if (LList->empty()) {
        // no loops -> no work to do
        return;
    }
    // allocate dependence graphs for function loops
    for (const llvm::Loop* L : *LList) {
        LG[L] = std::make_unique<Graph<NODE*,EDGE*>>(this, &F, L); 
    }
}

template <typename NODE, typename EDGE, typename PASS>
void GraphPass<NODE*,EDGE*,PASS>::getAnalysisUsage(llvm::AnalysisUsage& AU) const {
    AU.setPreservesAll();
    AU.addRequired<FunctionLoopInfoPass>();
    llvm_unreachable("Class template GraphPass cannot be used directly (without concrete specialization)!");
}

template <typename NODE, typename EDGE, typename PASS>
llvm::StringRef GraphPass<NODE*,EDGE*,PASS>::getPassName() const { 
    return PASS::getPassName(); 
}

template <typename NODE, typename EDGE, typename PASS>
bool GraphPass<NODE*,EDGE*,PASS>::runOnFunction(llvm::Function& F) {
    llvm_unreachable("Class template GraphPass cannot be used directly (without concrete specialization)!");
}

template <typename NODE, typename EDGE, typename PASS>
bool GraphPass<NODE*,EDGE*,PASS>::skipInstruction(const llvm::Instruction* Inst) {
    
    //  
    // We may need to omit some of the LLVM IR instructions
    // (debug intrinsics, etc.) out of dependence graphs
    
    if (isa<DbgInfoIntrinsic>(*Inst)) {
        return true;
    } else {
        return false;
    }
}

} // namespace ppar

#endif // #ifndef PPAR_GRAPH_PASS_IMPL_H

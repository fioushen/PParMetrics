#ifndef PPAR_CONTROL_DEPENDENCE_GRAPH_PRINTER_SPEC_H
#define PPAR_CONTROL_DEPENDENCE_GRAPH_PRINTER_SPEC_H

namespace ppar {

template <>
char GraphPrinter<llvm::BasicBlock*,ppar::Dependence*,ppar::ControlDependenceGraphPass>::ID = 0;

template <>
void GraphPrinter<llvm::BasicBlock*,ppar::Dependence*,ppar::ControlDependenceGraphPass>::getAnalysisUsage(llvm::AnalysisUsage& AU) const {
    AU.setPreservesAll();
    AU.addRequiredTransitive<ppar::GraphPass<llvm::BasicBlock*,ppar::Dependence*,ppar::ControlDependenceGraphPass>>();
}

template <>
void GraphPrinter<llvm::BasicBlock*,ppar::Dependence*,ppar::ControlDependenceGraphPass>::buildDotNode(llvm::BasicBlock* BB, DotNode* Node) {
    Node->setAttribute( /* name = */ string("shape"), /* value = */ string("rectangle"));

    string str;
    raw_string_ostream rso(str);
    BB->print(rso);
    Node->setAttribute( /* name = */ string("label"), /* value = */ str);
}

template <>
void GraphPrinter<llvm::BasicBlock*,ppar::Dependence*,ppar::ControlDependenceGraphPass>::buildDotEdge(ppar::Dependence* Dep, DotEdge* Edge) {}

} // namespace ppar

#endif // #ifndef PPAR_CONTROL_DEPENDENCE_GRAPH_PRINTER_SPEC_H

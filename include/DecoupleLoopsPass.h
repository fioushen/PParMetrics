#ifndef PPAR_DECOUPLE_LOOPS_PASS_H
#define PPAR_DECOUPLE_LOOPS_PASS_H

#include "ppar_common_includes.h"
#include "Graph.h"
#include "GraphPass.h"
#include "GraphPasses.h"

#include "llvm/Pass.h"
#include "llvm/PassAnalysisSupport.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"

#undef DEBUG_TYPE
#define DEBUG_TYPE "decouple-loops"

namespace ppar {

class LoopDependenceInfo {

    public:

        using DependenceGraph = Graph<llvm::Instruction*,ppar::Dependence*>;

        LoopDependenceInfo() {
            Iterator.clear();
            Payload.clear();
            SCCs.clear();
        }

        ~LoopDependenceInfo() {
            Iterator.clear();
            Payload.clear();
            SCCs.clear();
        }

        void addSCC(const DependenceGraph* S) { SCCs.insert(S); }
        void addPayloadSCC(const DependenceGraph* S) { Payload.insert(S); }
        void addIteratorSCC(const DependenceGraph* S) { Iterator.insert(S); }

        const std::unordered_set<const DependenceGraph*>& getIterator() const { return Iterator; }
        const std::unordered_set<const DependenceGraph*>& getPayload() const { return Payload; }
        const std::unordered_set<const DependenceGraph*>& getSCCs() const { return SCCs; }

    private:
        std::unordered_set<const DependenceGraph*> Iterator;
        std::unordered_set<const DependenceGraph*> Payload;
        std::unordered_set<const DependenceGraph*> SCCs; // Payload + Iterator
};

struct DecoupleLoopsPass : public llvm::FunctionPass {
    public:

        using DependenceGraph = Graph<llvm::Instruction*,ppar::Dependence*>;
        using PDGPass = GraphPass<llvm::Instruction*,ppar::Dependence*,ppar::ProgramDependenceGraphPass>;

        static char ID;
        DecoupleLoopsPass();

        bool runOnFunction(llvm::Function& F) override;
        void getAnalysisUsage(llvm::AnalysisUsage& AU) const override;
        llvm::StringRef getPassName() const;
        void releaseMemory() override;

        const std::unordered_map<const llvm::Loop*, std::unique_ptr<LoopDependenceInfo>>& getLoopsDepInfo() {
            return LoopsDepInfo;    
        }

    private:
        std::unordered_map<const llvm::Loop*, std::unique_ptr<LoopDependenceInfo>> LoopsDepInfo;
        std::vector<DependenceGraph*> ScalarCode;
};

} // namespace ppar

#endif // #ifndef PPAR_DECOUPLE_LOOPS_PASS_H
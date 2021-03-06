#include "MetricPrinter.h"

#include "MetricPass.h"
#include "MetricPasses.h"
#include "FunctionLoopInfo.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Format.h"
using namespace llvm;

#include <string>
#include <vector>
#include <queue>
#include <memory>
#include <map>
#include <unordered_map>
#include <set>
#include <fstream>
#include <iomanip>
#include <ios>
using namespace std;

RegisterPass<ppar::MetricPrinter> MetricPrinterPass(
    "ppar-metrics-collector",
    "Collect PPar metrics"
);

namespace ppar {

char MetricPrinter::ID = 0;

MetricPrinter::MetricPrinter() 
 : FunctionPass(ID), FP_precision(4) { 
    MetricFileStream_excel.open("metrics.excel", std::ofstream::out | std::ofstream::app);
    MetricFileStream_excel.precision(FP_precision);
    // write a header into the file for MicrosoftExcel/LibreOfficeCalc
    // print the top column names row
    // print function's name
    MetricFileStream_excel << "function:"; // the name of a function being analyzed
    // information identifying a loop
    MetricFileStream_excel << "loop-name-ppar:"; // loop name across the tool
    MetricFileStream_excel << "loop-name-llvm:"; // loop name in the llvm assembly
    MetricFileStream_excel << "loop-depth:";     // loop depth
    MetricFileStream_excel << "loop-location:";  // filesystem/file/location(file-line)
    // => metric names
    // loop proportion metrics
    MetricFileStream_excel << "loop-absolute-size:";
    MetricFileStream_excel << "loop-iterator-size:";
    MetricFileStream_excel << "loop-payload-fraction:";
    MetricFileStream_excel << "loop-proper-sccs-number:";
    MetricFileStream_excel << "loop-proper-sccs-ddg-number:";
    MetricFileStream_excel << "loop-proper-sccs-mdg-number:";
    MetricFileStream_excel << "loop-critical-payload-fraction:";
    MetricFileStream_excel << "loop-depth:";
    MetricFileStream_excel << "loop-inner-loop-num:";
    // loop cohesion metrics
    MetricFileStream_excel << "iterator-payload-total-cohesion:";
    MetricFileStream_excel << "iterator-payload-non-cf-cohesion:";
    MetricFileStream_excel << "iterator-payload-mem-cohesion:";
    MetricFileStream_excel << "critical-payload-total-cohesion:";
    MetricFileStream_excel << "critical-payload-non-cf-cohesion:";
    MetricFileStream_excel << "critical-payload-mem-cohesion:";
    // loop dependence number metrics
    MetricFileStream_excel << "iterator-total-dependencies-number:";
    MetricFileStream_excel << "iterator-true-dependencies-number:";
    MetricFileStream_excel << "iterator-anti-dependencies-number:";
    MetricFileStream_excel << "iterator-output-dependencies-number:";
    MetricFileStream_excel << "iterator-cross-dependencies-number:";
    MetricFileStream_excel << "iterator-conf-dependencies-number:";
    MetricFileStream_excel << "iterator-reg-dependencies-number:";
    MetricFileStream_excel << "iterator-mem-dependencies-number:";
    MetricFileStream_excel << "iterator-cntl-dependencies-number:";
    MetricFileStream_excel << "payload-total-dependencies-number:";
    MetricFileStream_excel << "payload-true-dependencies-number:";
    MetricFileStream_excel << "payload-anti-dependencies-number:";
    MetricFileStream_excel << "payload-output-dependencies-number:";
    MetricFileStream_excel << "payload-cross-dependencies-number:";
    MetricFileStream_excel << "payload-conf-dependencies-number:";
    MetricFileStream_excel << "payload-reg-dependencies-number:";
    MetricFileStream_excel << "payload-mem-dependencies-number:";
    MetricFileStream_excel << "payload-cntl-dependencies-number:";
    MetricFileStream_excel << "critical-payload-total-dependencies-number:";
    MetricFileStream_excel << "critical-payload-true-dependencies-number:";
    MetricFileStream_excel << "critical-payload-anti-dependencies-number:";
    MetricFileStream_excel << "critical-payload-output-dependencies-number:";
    MetricFileStream_excel << "critical-payload-cross-dependencies-number:";
    MetricFileStream_excel << "critical-payload-conf-dependencies-number:";
    MetricFileStream_excel << "critical-payload-reg-dependencies-number:";
    MetricFileStream_excel << "critical-payload-mem-dependencies-number:";
    MetricFileStream_excel << "critical-payload-cntl-dependencies-number:";
    // loop instruction nature metrics
    MetricFileStream_excel << "iterator-mem-write-count:";
    MetricFileStream_excel << "iterator-mem-write-fraction:";
    MetricFileStream_excel << "iterator-mem-read-count:";
    MetricFileStream_excel << "iterator-mem-read-fraction:";
    MetricFileStream_excel << "iterator-call-count:";
    MetricFileStream_excel << "iterator-call-fraction:";
    MetricFileStream_excel << "iterator-branch-count:";
    MetricFileStream_excel << "iterator-branch-fraction:";
    MetricFileStream_excel << "iterator-getelemptr-count:";
    MetricFileStream_excel << "iterator-getelemptr-fraction:";
    MetricFileStream_excel << "payload-mem-write-count:";
    MetricFileStream_excel << "payload-mem-write-fraction:";
    MetricFileStream_excel << "payload-mem-read-count:";
    MetricFileStream_excel << "payload-mem-read-fraction:";
    MetricFileStream_excel << "payload-call-count:";
    MetricFileStream_excel << "payload-call-fraction:";
    MetricFileStream_excel << "payload-branch-count:";
    MetricFileStream_excel << "payload-branch-fraction:";
    MetricFileStream_excel << "payload-getelemptr-count:";
    MetricFileStream_excel << "payload-getelemptr-fraction:";
    MetricFileStream_excel << "critical-payload-mem-write-count:";
    MetricFileStream_excel << "critical-payload-mem-write-fraction:";
    MetricFileStream_excel << "critical-payload-mem-read-count:";
    MetricFileStream_excel << "critical-payload-mem-read-fraction:";
    MetricFileStream_excel << "critical-payload-call-count:";
    MetricFileStream_excel << "critical-payload-call-fraction:";
    MetricFileStream_excel << "critical-payload-branch-count:";
    MetricFileStream_excel << "critical-payload-branch-fraction:";
    MetricFileStream_excel << "critical-payload-getelemptr-count:";
    MetricFileStream_excel << "critical-payload-getelemptr-fraction:";
    MetricFileStream_excel << "\n";
}

MetricPrinter::~MetricPrinter() {
    MetricFileStream_excel.close();
}

void MetricPrinter::releaseMemory() {}

void MetricPrinter::getAnalysisUsage(llvm::AnalysisUsage& AU) const {
    AU.setPreservesAll();
    AU.addRequired<LoopInfoWrapperPass>();
    AU.addRequired<FunctionLoopInfoPass>();
    AU.addRequired<ppar::MetricPass<ppar::LoopProportionMetrics>>();
    AU.addRequired<ppar::MetricPass<ppar::LoopCohesionMetrics>>();
    AU.addRequired<ppar::MetricPass<ppar::LoopDependenceMetrics>>();
    AU.addRequired<ppar::MetricPass<ppar::LoopNatureMetrics>>();
}

llvm::StringRef MetricPrinter::getPassName() const { 
    return "MetricPrinterPass"; 
}

bool MetricPrinter::runOnFunction(llvm::Function& F) {
    // metrics file for function F 
    std::error_code EC;
    llvm::raw_fd_ostream FuncMetricsFile(F.getName().str() + ".func.metrics", EC, sys::fs::F_Text);
    // function loops to print metrics for 
    const LoopInfo& LI = (getAnalysis<LoopInfoWrapperPass>()).getLoopInfo();
    ppar::FunctionLoopInfoPass& LInfoPass = (getAnalysis<FunctionLoopInfoPass>());
    const FunctionLoopInfoPass::FunctionLoopList* LList = LInfoPass.getFunctionLoopList(&F);
    const FunctionLoopInfoPass::LoopNames* LNames = LInfoPass.getFunctionLoopNames(&F);
    if (LList->empty() || LNames->empty()) {
        // no loops -> no work to do
        return false;
    }
    // consistency check
    if (LList->size() != LNames->size()) {
        llvm_unreachable("error: misformed ppar::FunctionLoopInfo data structures!\n \
                          Linear loop list size does not match the one of the loop name map!\n");
    }
  
    // get all computed currently available metrics out their corersponding passes
    MetricSet_func<ppar::LoopProportionMetrics>* LoopProportionMetric_func
        = (Pass::getAnalysis<ppar::MetricPass<ppar::LoopProportionMetrics>>()).getFunctionMetrics(F); 

    MetricSet_func<ppar::LoopCohesionMetrics>* LoopCohesionMetric_func
        = (Pass::getAnalysis<ppar::MetricPass<ppar::LoopCohesionMetrics>>()).getFunctionMetrics(F); 

    MetricSet_func<ppar::LoopDependenceMetrics>* LoopDependenceMetric_func
        = (Pass::getAnalysis<ppar::MetricPass<ppar::LoopDependenceMetrics>>()).getFunctionMetrics(F); 
 
    MetricSet_func<ppar::LoopNatureMetrics>* LoopNatureMetric_func
        = (Pass::getAnalysis<ppar::MetricPass<ppar::LoopNatureMetrics>>()).getFunctionMetrics(F); 
   
    // print a header into a function metrics file 
    FuncMetricsFile << "Function: " << F.getName().str() << " {\n\n";
    MetricFileStream_excel << F.getName().str() << "\n";

    // for every single function loop, print computed metrics into the file
    for (const llvm::Loop* L : *LList) {
        // get a name of the loop out of FunctionLoopInfo pass
        std::string LName;
        auto loop_name_it = LNames->find(L);
        if (loop_name_it != LNames->end()) {
            LName = loop_name_it->second;
        } else {
            llvm_unreachable("error: incomplete ppar::FunctionLoopInfoPass::LoopNames data structure!\n \
                              Metrics collector could not find a name of the loop!\n");
        }
        MetricFileStream_excel << ":";
        // print the header information identifying a loop in the function body
        FuncMetricsFile << "===== Loop [" << LName << "] =====\n";
        FuncMetricsFile << "llvm::LoopInfo name: " << L->getName() << "\n";
/*        FuncMetricsFile << *L << "\n";
        uint64_t Line;
        StringRef File;
        StringRef Dir;
        FuncMetricsFile << "Loop can be found \n";
        for (typename Loop::block_iterator bb_it = L->block_begin(); bb_it != L->block_end(); ++bb_it) {
            for (typename BasicBlock::iterator inst_it = (*bb_it)->begin(); inst_it != (*bb_it)->end(); ++inst_it) {
                Instruction* I = &(*inst_it);
                if (DILocation *Loc = I->getDebugLoc()) {
                    if (I->isTerminator()) {
                        Line = Loc->getLine();
                        File = Loc->getFilename();
                        FuncMetricsFile << "at " << File << ":" << Line << "\n";
                    }
                }
            }
        }
        FuncMetricsFile << "\n";*/
        // print the loop location in the original source code file
        llvm::Loop::LocRange LoopLocRange = L->getLocRange();
        FuncMetricsFile << "Loop located ";
        if (LoopLocRange) {
            const DebugLoc& LoopStart = LoopLocRange.getStart();  
            const DebugLoc& LoopEnd = LoopLocRange.getEnd();  
            DILocation* StartLoc = LoopStart.get();
            DILocation* EndLoc = LoopEnd.get();
            uint64_t StartLine = StartLoc->getLine();
            StringRef StartFile = StartLoc->getFilename();
            uint64_t EndLine = StartLoc->getLine();
            StringRef EndFile = StartLoc->getFilename();
            if (StartFile != EndFile) {
                llvm_unreachable("error: MetricPrinter cannot print loop DebugInfo!\n \
                                  Start and End filenames do not match. Loops cannot span several files!\n");
            }
            FuncMetricsFile << "at " << StartFile << ":" << StartLine << "-" << EndLine << "\n\n";
            MetricFileStream_excel << LName << ":" << L->getName().str() << ":" << L->getLoopDepth() << ":" << StartFile.str() << "(" << StartLine << ")" << ":";
        } else {
            FuncMetricsFile << "at undefined location!\n\n";
            MetricFileStream_excel << LName << ":" << L->getName().str() << ":" << L->getLoopDepth() << ":" << "undefined-loop" << ":";
        }

        // print all computed metrics 
        FuncMetricsFile << "Loop Proportion Metric Set:\n";
        if (LoopProportionMetric_func != nullptr) {
            MetricSet_loop<ppar::LoopProportionMetrics>* LoopProportionMetrics_loop = LoopProportionMetric_func->getLoopMetrics(L);
            if (LoopProportionMetrics_loop != nullptr) {
                double Metric = -1;
                Metric = LoopProportionMetrics_loop->getMetricValue(ppar::LoopProportionMetrics::ProportionMetric_t::LOOP_ABSOLUTE_SIZE);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tloop-absolute-size: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tloop-absolute-size:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopProportionMetrics_loop->getMetricValue(ppar::LoopProportionMetrics::ProportionMetric_t::LOOP_ITERATOR_SIZE);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tloop-iterator-size: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tloop-iterator-size:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopProportionMetrics_loop->getMetricValue(ppar::LoopProportionMetrics::ProportionMetric_t::LOOP_PAYLOAD_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tloop-payload-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tloop-payload-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopProportionMetrics_loop->getMetricValue(ppar::LoopProportionMetrics::ProportionMetric_t::LOOP_PROPER_SCCS_NUMBER);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tloop-proper-sccs-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tloop-proper-sccs-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopProportionMetrics_loop->getMetricValue(ppar::LoopProportionMetrics::ProportionMetric_t::LOOP_PROPER_SCCS_DDG_NUMBER);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tloop-proper-sccs-ddg-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tloop-proper-sccs-ddg-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopProportionMetrics_loop->getMetricValue(ppar::LoopProportionMetrics::ProportionMetric_t::LOOP_PROPER_SCCS_MDG_NUMBER);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tloop-proper-sccs-mdg-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tloop-proper-sccs-mdg-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopProportionMetrics_loop->getMetricValue(ppar::LoopProportionMetrics::ProportionMetric_t::LOOP_CRITICAL_PAYLOAD_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tloop-critical-payload-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tloop-critical-payload-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopProportionMetrics_loop->getMetricValue(ppar::LoopProportionMetrics::ProportionMetric_t::LOOP_DEPTH);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tloop-depth: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tloop-depth:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopProportionMetrics_loop->getMetricValue(ppar::LoopProportionMetrics::ProportionMetric_t::LOOP_INNER_LOOP_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tloop-inner-loop-num: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tloop-inner-loop-num:\n";
                    MetricFileStream_excel << "-:";
                }
           } else {
               FuncMetricsFile << "\tloop-absolute-size:\n";
               FuncMetricsFile << "\tloop-iterator-size:\n";
               FuncMetricsFile << "\tloop-payload-fraction:\n";
               FuncMetricsFile << "\tloop-proper-sccs-number:\n";
               FuncMetricsFile << "\tloop-proper-sccs-ddg-number:\n";
               FuncMetricsFile << "\tloop-proper-sccs-mdg-number:\n";
               FuncMetricsFile << "\tloop-critical-payload-fraction:\n";
               FuncMetricsFile << "\tloop-depth:\n";
               FuncMetricsFile << "\tloop-inner-loop-num:\n";
               MetricFileStream_excel << "-:";
               MetricFileStream_excel << "-:";
               MetricFileStream_excel << "-:";
               MetricFileStream_excel << "-:";
               MetricFileStream_excel << "-:";
               MetricFileStream_excel << "-:";
               MetricFileStream_excel << "-:";
               MetricFileStream_excel << "-:";
               MetricFileStream_excel << "-:";
           }
        } else {
            FuncMetricsFile << "\tNo Loop Proportion Metrics have been computed!\n";
        }
        FuncMetricsFile << "\n";

        FuncMetricsFile << "Loop Cohesion Metric Set:\n";

        if (LoopCohesionMetric_func != nullptr) {
            MetricSet_loop<ppar::LoopCohesionMetrics>* LoopCohesionMetrics_loop = LoopCohesionMetric_func->getLoopMetrics(L);
            if (LoopCohesionMetrics_loop != nullptr) {
                double Metric = -1;
                Metric = LoopCohesionMetrics_loop->getMetricValue(ppar::LoopCohesionMetrics::CohesionMetric_t::ITERATOR_PAYLOAD_TOTAL_COHESION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-payload-total-cohesion: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-payload-total-cohesion:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopCohesionMetrics_loop->getMetricValue(ppar::LoopCohesionMetrics::CohesionMetric_t::ITERATOR_PAYLOAD_NON_CF_COHESION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-payload-non-cf-cohesion: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-payload-non-cf-cohesion:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopCohesionMetrics_loop->getMetricValue(ppar::LoopCohesionMetrics::CohesionMetric_t::ITERATOR_PAYLOAD_MEM_COHESION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-payload-mem-cohesion: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-payload-mem-cohesion:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopCohesionMetrics_loop->getMetricValue(ppar::LoopCohesionMetrics::CohesionMetric_t::CRITICAL_PAYLOAD_TOTAL_COHESION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-total-cohesion: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-total-cohesion:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopCohesionMetrics_loop->getMetricValue(ppar::LoopCohesionMetrics::CohesionMetric_t::CRITICAL_PAYLOAD_NON_CF_COHESION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-non-cf-cohesion: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-non-cf-cohesion:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopCohesionMetrics_loop->getMetricValue(ppar::LoopCohesionMetrics::CohesionMetric_t::CRITICAL_PAYLOAD_MEM_COHESION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-mem-cohesion: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-mem-cohesion:\n";
                    MetricFileStream_excel << "-:";
                }
            } else {
                FuncMetricsFile << "\titerator-payload-total-cohesion:\n";
                FuncMetricsFile << "\titerator-payload-non-cf-cohesion:\n";
                FuncMetricsFile << "\titerator-payload-mem-cohesion:\n";
                FuncMetricsFile << "\tcritical-payload-total-cohesion:\n";
                FuncMetricsFile << "\tcritical-payload-non-cf-cohesion:\n";
                FuncMetricsFile << "\tcritical-payload-mem-cohesion:\n";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
            }
        } else {
            FuncMetricsFile << "\tNo Loop Cohesion Metrics have been computed!\n";
        }
        FuncMetricsFile << "\n";

        FuncMetricsFile << "Loop Dependence Metric Set:\n";

        if (LoopDependenceMetric_func != nullptr) {
            MetricSet_loop<ppar::LoopDependenceMetrics>* LoopDependenceMetrics_loop = LoopDependenceMetric_func->getLoopMetrics(L);
            if (LoopDependenceMetrics_loop != nullptr) {
                double Metric = -1;
                // print iterator dependencies
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::ITERATOR_TOTAL_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-total-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-total-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::ITERATOR_TRUE_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-true-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-true-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::ITERATOR_ANTI_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-anti-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-anti-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::ITERATOR_OUTPUT_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-output-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-output-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::ITERATOR_CROSS_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-cross-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-cross-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::ITERATOR_CONF_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-conf-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-conf-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::ITERATOR_REG_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-reg-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-reg-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::ITERATOR_MEM_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-mem-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-mem-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::ITERATOR_CNTL_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-cntl-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-cntl-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                // print payload dependencies
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::PAYLOAD_TOTAL_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-total-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-total-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::PAYLOAD_TRUE_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-true-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-true-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::PAYLOAD_ANTI_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-anti-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-anti-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::PAYLOAD_OUTPUT_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-output-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-output-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::PAYLOAD_CROSS_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-cross-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-cross-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::PAYLOAD_CONF_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-conf-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-conf-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::PAYLOAD_REG_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-reg-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-reg-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::PAYLOAD_MEM_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-mem-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-mem-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::PAYLOAD_CNTL_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-cntl-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-cntl-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                // print critical payload dependencies
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::CRITICAL_PAYLOAD_TOTAL_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-total-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-total-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::CRITICAL_PAYLOAD_TRUE_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-true-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-true-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::CRITICAL_PAYLOAD_ANTI_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-anti-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-anti-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::CRITICAL_PAYLOAD_OUTPUT_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-output-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-output-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::CRITICAL_PAYLOAD_CROSS_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-cross-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-cross-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::CRITICAL_PAYLOAD_CONF_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-conf-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-conf-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::CRITICAL_PAYLOAD_REG_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-reg-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-reg-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::CRITICAL_PAYLOAD_MEM_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-mem-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-mem-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopDependenceMetrics_loop->getMetricValue(ppar::LoopDependenceMetrics::DependenceMetric_t::CRITICAL_PAYLOAD_MEM_DEPENDENCIES_NUM);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-cntl-dependencies-number: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-cntl-dependencies-number:\n";
                    MetricFileStream_excel << "-:";
                }
            } else {
                // print iterator dependencies
                FuncMetricsFile << "\titerator-total-dependencies-number:\n";
                FuncMetricsFile << "\titerator-true-dependencies-number:\n";
                FuncMetricsFile << "\titerator-anti-dependencies-number:\n";
                FuncMetricsFile << "\titerator-output-dependencies-number:\n";
                FuncMetricsFile << "\titerator-cross-dependencies-number:\n";
                FuncMetricsFile << "\titerator-conf-dependencies-number:\n";
                FuncMetricsFile << "\titerator-reg-dependencies-number:\n";
                FuncMetricsFile << "\titerator-mem-dependencies-number:\n";
                FuncMetricsFile << "\titerator-cntl-dependencies-number:\n";
                // print payload dependencies
                FuncMetricsFile << "\tpayload-total-dependencies-number:\n";
                FuncMetricsFile << "\tpayload-true-dependencies-number:\n";
                FuncMetricsFile << "\tpayload-anti-dependencies-number:\n";
                FuncMetricsFile << "\tpayload-output-dependencies-number:\n";
                FuncMetricsFile << "\tpayload-cross-dependencies-number:\n";
                FuncMetricsFile << "\tpayload-conf-dependencies-number:\n";
                FuncMetricsFile << "\tpayload-reg-dependencies-number:\n";
                FuncMetricsFile << "\tpayload-mem-dependencies-number:\n";
                FuncMetricsFile << "\tpayload-cntl-dependencies-number:\n";
                // print critical payload dependencies
                FuncMetricsFile << "\tcritical-payload-total-dependencies-number:\n";
                FuncMetricsFile << "\tcritical-payload-true-dependencies-number:\n";
                FuncMetricsFile << "\tcritical-payload-anti-dependencies-number:\n";
                FuncMetricsFile << "\tcritical-payload-output-dependencies-number:\n";
                FuncMetricsFile << "\tcritical-payload-cross-dependencies-number:\n";
                FuncMetricsFile << "\tcritical-payload-conf-dependencies-number:\n";
                FuncMetricsFile << "\tcritical-payload-reg-dependencies-number:\n";
                FuncMetricsFile << "\tcritical-payload-mem-dependencies-number:\n";
                FuncMetricsFile << "\tcritical-payload-cntl-dependencies-number:\n";

                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
            }
        } else {
            FuncMetricsFile << "\tNo Loop Dependence Metrics have been computed!\n";
        }
        FuncMetricsFile << "\n";

        FuncMetricsFile << "Loop Nature Metric Set:\n";

        if (LoopNatureMetric_func != nullptr) {
            MetricSet_loop<ppar::LoopNatureMetrics>* LoopNatureMetrics_loop = LoopNatureMetric_func->getLoopMetrics(L);
            if (LoopNatureMetrics_loop != nullptr) {
                double Metric = -1;
                // print iterator related loop instructions nature metrics
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_MEM_WRITE_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-mem-write-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-mem-write-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_MEM_WRITE_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-mem-write-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-mem-write-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_MEM_READ_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-mem-read-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-mem-read-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_MEM_READ_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-mem-read-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-mem-read-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_CALL_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-call-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-call-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_CALL_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-call-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-call-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_BRANCH_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-branch-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-branch-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_BRANCH_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-branch-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-branch-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_GETELEMPTR_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-getelemptr-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-getelemptr-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::ITERATOR_GETELEMPTR_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\titerator-getelemptr-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\titerator-getelemptr-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                // print payload related loop instructions nature metrics
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_MEM_WRITE_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-mem-write-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-mem-write-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_MEM_WRITE_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-mem-write-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-mem-write-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_MEM_READ_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-mem-read-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-mem-read-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_MEM_READ_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-mem-read-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-mem-read-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_CALL_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-call-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-call-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_CALL_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-call-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-call-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_BRANCH_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-branch-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-branch-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_BRANCH_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-branch-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-branch-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_GETELEMPTR_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-getelemptr-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-getelemptr-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::PAYLOAD_GETELEMPTR_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tpayload-getelemptr-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tpayload-getelemptr-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                // print critical payload related loop instructions nature metrics
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_MEM_WRITE_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-mem-write-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-mem-write-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_MEM_WRITE_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-mem-write-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-mem-write-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_MEM_READ_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-mem-read-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-mem-read-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_MEM_READ_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-mem-read-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-mem-read-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_CALL_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-call-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-call-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_CALL_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-call-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-call-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_BRANCH_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-branch-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-branch-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_BRANCH_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-branch-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-branch-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_GETELEMPTR_COUNT);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-getelemptr-count: " << llvm::format("%d", (uint64_t)Metric) << "\n";
                    MetricFileStream_excel << (uint64_t)Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-getelemptr-count:\n";
                    MetricFileStream_excel << "-:";
                }
                Metric = LoopNatureMetrics_loop->getMetricValue(ppar::LoopNatureMetrics::NatureMetric_t::CRITICAL_PAYLOAD_GETELEMPTR_FRACTION);
                if (Metric >= 0) {
                    FuncMetricsFile << "\tcritical-payload-getelemptr-fraction: " << llvm::format("%.4f", Metric) << "\n";
                    MetricFileStream_excel << Metric << ":";
                } else {
                    FuncMetricsFile << "\tcritical-payload-getelemptr-fraction:\n";
                    MetricFileStream_excel << "-:";
                }
            } else {
                // print iterator related loop instruction nature metrics
                FuncMetricsFile << "\titerator-mem-write-count:\n";
                FuncMetricsFile << "\titerator-mem-write-fraction:\n";
                FuncMetricsFile << "\titerator-mem-read-count:\n";
                FuncMetricsFile << "\titerator-mem-read-fraction:\n";
                FuncMetricsFile << "\titerator-call-count:\n";
                FuncMetricsFile << "\titerator-call-fraction:\n";
                FuncMetricsFile << "\titerator-branch-count:\n";
                FuncMetricsFile << "\titerator-branch-fraction:\n";
                FuncMetricsFile << "\titerator-getelemptr-count:\n";
                FuncMetricsFile << "\titerator-getelemptr-fraction:\n";
                // print payload related loop instruction nature metrics
                FuncMetricsFile << "\tpayload-mem-write-count:\n";
                FuncMetricsFile << "\tpayload-mem-write-fraction:\n";
                FuncMetricsFile << "\tpayload-mem-read-count:\n";
                FuncMetricsFile << "\tpayload-mem-read-fraction:\n";
                FuncMetricsFile << "\tpayload-call-count:\n";
                FuncMetricsFile << "\tpayload-call-fraction:\n";
                FuncMetricsFile << "\tpayload-branch-count:\n";
                FuncMetricsFile << "\tpayload-branch-fraction:\n";
                FuncMetricsFile << "\tpayload-getelemptr-count:\n";
                FuncMetricsFile << "\tpayload-getelemptr-fraction:\n";
                // print critical payload related loop instruction nature metrics
                FuncMetricsFile << "\tcritical-payload-mem-write-count:\n";
                FuncMetricsFile << "\tcritical-payload-mem-write-fraction:\n";
                FuncMetricsFile << "\tcritical-payload-mem-read-count:\n";
                FuncMetricsFile << "\tcritical-payload-mem-read-fraction:\n";
                FuncMetricsFile << "\tcritical-payload-call-count:\n";
                FuncMetricsFile << "\tcritical-payload-call-fraction:\n";
                FuncMetricsFile << "\tcritical-payload-branch-count:\n";
                FuncMetricsFile << "\tcritical-payload-branch-fraction:\n";
                FuncMetricsFile << "\tcritical-payload-getelemptr-count:\n";
                FuncMetricsFile << "\tcritical-payload-getelemptr-fraction:\n";

                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
                MetricFileStream_excel << "-:";
            }
        } else {
            FuncMetricsFile << "\tNo Loop Nature Metrics have been computed!\n";
        }
        FuncMetricsFile << "\n";

        MetricFileStream_excel << "\n";
    }
    FuncMetricsFile << "}\n";

    FuncMetricsFile.close();

    return false;
}
 
} // namespace ppar

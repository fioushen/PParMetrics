# PParMetrics (Pervasive Parallelism Software Metrics)

"Smart" Parallelisation Assistant (Software Metrics for Parallelism)

# Brief project description
This is a research project on the possibility of using machine learning (ML) techniques in order to assist a programmer in the task of manual software parallelisation. This is not a final production quality tool, but rather a playground for the proof of concept and the assessment of idea's practical usefullness. 

# Project directory layout
The project consists of several components wrapped up together with the help of Bash scripts (_scripts/_). The main project components are:

1) LLVM-based PParTool (_include/_, _src/_) computing ML feature vectors for program loops. 

2) Intel C/C++ Compiler (ICC) optimization report parser (_scripts/icc/_) pulled from the 
https://github.com/av-maramzin/icc-opt-report-compiler.git repository. The parser is used to extract the list of loop classification labels.  

3) ML train/test pipeline scripts (_scripts/ml_). 

4) Benchmarks _benchmarks/_ include SNU NAS Parallel Benchmarks (benchmarks/snu-npb) and SPEC CPU2006 (benchmarks/spec-cpu2006/), although only SNU NPB are currectly used for a research.

5) The _playground/_ folder is used for a quick experimentation with toy examples. Initial implementation and debugging.

6) Documents _doc_ gather all presentations, posters, texts, etc. from several events and meetings. 

# Typical workflows
The whole end-to-end process is not fully automated and requires several separate steps to perform.

Getting classification labels for 


* Getting feature vectors for SNU NPB
1) We need to build .so library. That can be done by running:
./scripts/build-scripts/build-ppar-metrics-so-library.sh

It will create build/ directory with the library libppar.so.

2) Getting classification labels for SNU NPB
3) 

# [Project requirements]
The project uses and is dependent upon a number of software libraries, software frameworks tools and technologies:
* Python
* CMake
* C/C++ compiler with C++11 support
* LLVM library of compiler components
* scikit-learn machine learning library

# [Project directory layout]
**1)** The project is built, run and controlled by a set of scripts, stored in the {project-root}/scripts/ directory.

# [Project motivation & history]

PPar project started as an attempt to device and evaluate develop

This work stems from the existing work in the field of Software Quality. There are numerous software metrics available 
for judging about source code readability, maintainability, etc. Cyclomatic Complexity (CC) metric [1] probably serves as 
the most illustrative example. This work is an attempt to develop an analogous set of software metrics, suitable for 
assessing source code parallelisability.

# [High-level project overview]

This tool is implemented as a set of LLVM passes and is based on the work [2], described in paper [3]. First, the tool uses 
LLVM framework to build Dependence Graph of the Program (PDG). Program Dependence Graph (PDG) consists of the 3 constituent 
graphs: Data Dependence Graph (DDG) + Memory Dependence Graph (MDG) + Control Dependence Graph (CDG). Detailed descriptions 
of the graphs can be found in the general dependence analysis theory as in [4] or in the original paper [5]. Then, all these 
graphs are disassembled into their constituent Strongly Connected Components (SCCs), using algorithm based on 2 depth-first 
searches as described in [6]. These SCCs are used to decouple loop iterator from the actual workload (called the payload 
withing the project terminology) of the loop. At the final stage of the workflow, all these constituent components (with all 
the dependence information, gathered along the way) are used to compute a set of metrics. 
    The intuition behind all these steps is quite simple.  

[Software Parallelisability Metrics]

PPar tool uses LLVM framework of compiler components (specifically Instruction class built-in Use-Def chains, Memory
Dependence Analysis, Post-dominator tree) to build a Program Dependence Graph (PDG). PDG can be built within different
scopes. The tool builds PDGs for all functions of the program being analyzed and for every single loop within a function:
function PDG and loop PDG correspondingly. PDG consists of all LLVM-IR instructions within the given scope. Edges of the 
PDG represent different sorts of dependencies between instructions. The edge set of the PDG includes all edges from Data
Dependence Graph (DDG), Memory Dependence Graph (MDG) and Control Dependence Graph (CDG). Edges are further classified
into True/Read-After-Write(RAW)/Flow, Anti/Write-After-Read(WAR), Output/Write-After-Write(WAW) types of dependencies. 

PPar tool decomposition rules:

{} - empty/nothing
Function := Loop-Set Scalar-Code
Loop-Set := Loop Loop-Set | {}
Scalar-Code := Graph-Node-Set Graph-Edge-Set
Graph-Node-Set := LLVM-IR-instructions
Loop := Iterator Loop-Body
Loop-Body := Payload | {}
Payload := Critical-SCCs Regular-SCCs |

PDG := DDG + MDG + CDG
DDG := All-Nodes Use-Def-Register-Edges
MDG := Mem-Nodes Mem-Dependencies
CDG := All-Nodes

Mem-Nodes := Mem-Node Mem-Nodes | {}
Mem-Node := LLVM-IR-load-instruction LLVM-IR-store-instruction

All-Nodes := Node All-Nodes | {}
Node := LLVM-IR-instruction // any LLVM-IR instruction, including loads and stores

[Source code details]

[Technical Requirements and Details]

The tool is developed as LLVM dynamic opt tool plug-in library.

In order to use the tool, you need to have:
1) LLVM 6.0
2) CMake 3.11

[References]

[1] Thomas J. McCabe. A Complexity Measure. IEEE Transactions on Software Engineering, Vol. SE-2, No.4, December, 1976.
[2] https://github.com/compor/icsa-dswp
[3] Stanislav Manilov, Christos Vasiladiotis, Björn Franke. Generalized Profile-Guided Iterator Recognition. The University of Edinburgh. CC’18, February 24–25, 2018, Vienna, Austria.
[4] Randy Allen Ken Kennedy. Optimizing Compilers for Modern Architectures. A Dependence-based Approach.
[5] Jeanne Ferrante, Karl J. Ottenstein, Joe D. Warren. The program dependence graph and its use in optimization. ACM Transactions on Programming Languages and Systems, Vol.9, No.3, July 1987, Pages 319-349.
[6] Introduction to Algorithms. 3rd edition. Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein.

# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run

# Utility rule file for BasicBitcodeGen_ft_bc.

# Include the progress variables for this target.
include FT/CMakeFiles/BasicBitcodeGen_ft_bc.dir/progress.make

FT/CMakeFiles/BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/ft.bc
FT/CMakeFiles/BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/c_print_results.bc
FT/CMakeFiles/BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/c_timers.bc
FT/CMakeFiles/BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/print_results.bc
FT/CMakeFiles/BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/wtime.bc
FT/CMakeFiles/BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/randdp.bc


FT/llvm-ir/BasicBitcodeGen_ft_bc/ft.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT/src/ft.c
FT/llvm-ir/BasicBitcodeGen_ft_bc/ft.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT/src/ft.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating LLVM bitcode ft.bc"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT && /home/s1736883/Work/llvm/build-70/bin/clang -emit-llvm -g -Wall -mcmodel=medium -O0 -fno-inline-functions -Xclang -disable-O0-optnone -I/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT/src/ -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT/src/ft.c -o /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT/llvm-ir/BasicBitcodeGen_ft_bc/ft.bc

FT/llvm-ir/BasicBitcodeGen_ft_bc/c_print_results.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c
FT/llvm-ir/BasicBitcodeGen_ft_bc/c_print_results.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating LLVM bitcode c_print_results.bc"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT && /home/s1736883/Work/llvm/build-70/bin/clang -emit-llvm -g -Wall -mcmodel=medium -O0 -fno-inline-functions -Xclang -disable-O0-optnone -I/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT/src/ -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c -o /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT/llvm-ir/BasicBitcodeGen_ft_bc/c_print_results.bc

FT/llvm-ir/BasicBitcodeGen_ft_bc/c_timers.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c
FT/llvm-ir/BasicBitcodeGen_ft_bc/c_timers.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating LLVM bitcode c_timers.bc"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT && /home/s1736883/Work/llvm/build-70/bin/clang -emit-llvm -g -Wall -mcmodel=medium -O0 -fno-inline-functions -Xclang -disable-O0-optnone -I/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT/src/ -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c -o /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT/llvm-ir/BasicBitcodeGen_ft_bc/c_timers.bc

FT/llvm-ir/BasicBitcodeGen_ft_bc/print_results.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c
FT/llvm-ir/BasicBitcodeGen_ft_bc/print_results.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating LLVM bitcode print_results.bc"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT && /home/s1736883/Work/llvm/build-70/bin/clang -emit-llvm -g -Wall -mcmodel=medium -O0 -fno-inline-functions -Xclang -disable-O0-optnone -I/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT/src/ -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c -o /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT/llvm-ir/BasicBitcodeGen_ft_bc/print_results.bc

FT/llvm-ir/BasicBitcodeGen_ft_bc/wtime.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c
FT/llvm-ir/BasicBitcodeGen_ft_bc/wtime.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Generating LLVM bitcode wtime.bc"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT && /home/s1736883/Work/llvm/build-70/bin/clang -emit-llvm -g -Wall -mcmodel=medium -O0 -fno-inline-functions -Xclang -disable-O0-optnone -I/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT/src/ -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c -o /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT/llvm-ir/BasicBitcodeGen_ft_bc/wtime.bc

FT/llvm-ir/BasicBitcodeGen_ft_bc/randdp.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/randdp.c
FT/llvm-ir/BasicBitcodeGen_ft_bc/randdp.bc: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/randdp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Generating LLVM bitcode randdp.bc"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT && /home/s1736883/Work/llvm/build-70/bin/clang -emit-llvm -g -Wall -mcmodel=medium -O0 -fno-inline-functions -Xclang -disable-O0-optnone -I/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common -I/home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT/src/ -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/randdp.c -o /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT/llvm-ir/BasicBitcodeGen_ft_bc/randdp.bc

BasicBitcodeGen_ft_bc: FT/CMakeFiles/BasicBitcodeGen_ft_bc
BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/ft.bc
BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/c_print_results.bc
BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/c_timers.bc
BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/print_results.bc
BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/wtime.bc
BasicBitcodeGen_ft_bc: FT/llvm-ir/BasicBitcodeGen_ft_bc/randdp.bc
BasicBitcodeGen_ft_bc: FT/CMakeFiles/BasicBitcodeGen_ft_bc.dir/build.make

.PHONY : BasicBitcodeGen_ft_bc

# Rule to build all files generated by this target.
FT/CMakeFiles/BasicBitcodeGen_ft_bc.dir/build: BasicBitcodeGen_ft_bc

.PHONY : FT/CMakeFiles/BasicBitcodeGen_ft_bc.dir/build

FT/CMakeFiles/BasicBitcodeGen_ft_bc.dir/clean:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT && $(CMAKE_COMMAND) -P CMakeFiles/BasicBitcodeGen_ft_bc.dir/cmake_clean.cmake
.PHONY : FT/CMakeFiles/BasicBitcodeGen_ft_bc.dir/clean

FT/CMakeFiles/BasicBitcodeGen_ft_bc.dir/depend:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/FT /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/FT/CMakeFiles/BasicBitcodeGen_ft_bc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : FT/CMakeFiles/BasicBitcodeGen_ft_bc.dir/depend


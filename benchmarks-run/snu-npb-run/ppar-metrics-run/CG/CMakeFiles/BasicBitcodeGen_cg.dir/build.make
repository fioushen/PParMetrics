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

# Utility rule file for BasicBitcodeGen_cg.

# Include the progress variables for this target.
include CG/CMakeFiles/BasicBitcodeGen_cg.dir/progress.make

CG/CMakeFiles/BasicBitcodeGen_cg: CG/llvm-ir/BasicBitcodeGen_cg_bc_exe/BasicBitcodeGen_cg_bc_exe


BasicBitcodeGen_cg: CG/CMakeFiles/BasicBitcodeGen_cg
BasicBitcodeGen_cg: CG/CMakeFiles/BasicBitcodeGen_cg.dir/build.make

.PHONY : BasicBitcodeGen_cg

# Rule to build all files generated by this target.
CG/CMakeFiles/BasicBitcodeGen_cg.dir/build: BasicBitcodeGen_cg

.PHONY : CG/CMakeFiles/BasicBitcodeGen_cg.dir/build

CG/CMakeFiles/BasicBitcodeGen_cg.dir/clean:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/CG && $(CMAKE_COMMAND) -P CMakeFiles/BasicBitcodeGen_cg.dir/cmake_clean.cmake
.PHONY : CG/CMakeFiles/BasicBitcodeGen_cg.dir/clean

CG/CMakeFiles/BasicBitcodeGen_cg.dir/depend:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/CG /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/CG /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/CG/CMakeFiles/BasicBitcodeGen_cg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CG/CMakeFiles/BasicBitcodeGen_cg.dir/depend

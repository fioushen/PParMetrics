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

# Utility rule file for PParMetrics_sp.

# Include the progress variables for this target.
include SP/CMakeFiles/PParMetrics_sp.dir/progress.make

SP/CMakeFiles/PParMetrics_sp: SP/llvm-ir/PParMetrics_sp_bc_exe/PParMetrics_sp_bc_exe


PParMetrics_sp: SP/CMakeFiles/PParMetrics_sp
PParMetrics_sp: SP/CMakeFiles/PParMetrics_sp.dir/build.make

.PHONY : PParMetrics_sp

# Rule to build all files generated by this target.
SP/CMakeFiles/PParMetrics_sp.dir/build: PParMetrics_sp

.PHONY : SP/CMakeFiles/PParMetrics_sp.dir/build

SP/CMakeFiles/PParMetrics_sp.dir/clean:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/SP && $(CMAKE_COMMAND) -P CMakeFiles/PParMetrics_sp.dir/cmake_clean.cmake
.PHONY : SP/CMakeFiles/PParMetrics_sp.dir/clean

SP/CMakeFiles/PParMetrics_sp.dir/depend:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/SP /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/SP /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/ppar-metrics-run/SP/CMakeFiles/PParMetrics_sp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : SP/CMakeFiles/PParMetrics_sp.dir/depend


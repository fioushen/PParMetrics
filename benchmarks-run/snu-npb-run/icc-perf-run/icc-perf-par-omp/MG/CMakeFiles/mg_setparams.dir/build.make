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
CMAKE_BINARY_DIR = /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-par-omp

# Utility rule file for mg_setparams.

# Include the progress variables for this target.
include MG/CMakeFiles/mg_setparams.dir/progress.make

MG/CMakeFiles/mg_setparams:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating npbparams.h"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-par-omp/MG && /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-par-omp/setparams mg B

mg_setparams: MG/CMakeFiles/mg_setparams
mg_setparams: MG/CMakeFiles/mg_setparams.dir/build.make

.PHONY : mg_setparams

# Rule to build all files generated by this target.
MG/CMakeFiles/mg_setparams.dir/build: mg_setparams

.PHONY : MG/CMakeFiles/mg_setparams.dir/build

MG/CMakeFiles/mg_setparams.dir/clean:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-par-omp/MG && $(CMAKE_COMMAND) -P CMakeFiles/mg_setparams.dir/cmake_clean.cmake
.PHONY : MG/CMakeFiles/mg_setparams.dir/clean

MG/CMakeFiles/mg_setparams.dir/depend:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-par-omp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/MG /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-par-omp /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-par-omp/MG /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-par-omp/MG/CMakeFiles/mg_setparams.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : MG/CMakeFiles/mg_setparams.dir/depend


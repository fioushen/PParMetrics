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
CMAKE_BINARY_DIR = /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-prof-report-run

# Utility rule file for bt_setparams.

# Include the progress variables for this target.
include BT/CMakeFiles/bt_setparams.dir/progress.make

BT/CMakeFiles/bt_setparams:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-prof-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating npbparams.h"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-prof-report-run/BT && /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-prof-report-run/setparams bt B

bt_setparams: BT/CMakeFiles/bt_setparams
bt_setparams: BT/CMakeFiles/bt_setparams.dir/build.make

.PHONY : bt_setparams

# Rule to build all files generated by this target.
BT/CMakeFiles/bt_setparams.dir/build: bt_setparams

.PHONY : BT/CMakeFiles/bt_setparams.dir/build

BT/CMakeFiles/bt_setparams.dir/clean:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-prof-report-run/BT && $(CMAKE_COMMAND) -P CMakeFiles/bt_setparams.dir/cmake_clean.cmake
.PHONY : BT/CMakeFiles/bt_setparams.dir/clean

BT/CMakeFiles/bt_setparams.dir/depend:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-prof-report-run && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-prof-report-run /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-prof-report-run/BT /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-prof-report-run/BT/CMakeFiles/bt_setparams.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : BT/CMakeFiles/bt_setparams.dir/depend


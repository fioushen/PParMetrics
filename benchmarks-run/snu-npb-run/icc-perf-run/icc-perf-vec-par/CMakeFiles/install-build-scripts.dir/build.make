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
CMAKE_BINARY_DIR = /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par

# Utility rule file for install-build-scripts.

# Include the progress variables for this target.
include CMakeFiles/install-build-scripts.dir/progress.make

CMakeFiles/install-build-scripts:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "copying build-tree related scripts"
	/usr/local/bin/cmake -E copy_directory /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/utils/scripts/build_tree/ /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par/scripts/

install-build-scripts: CMakeFiles/install-build-scripts
install-build-scripts: CMakeFiles/install-build-scripts.dir/build.make

.PHONY : install-build-scripts

# Rule to build all files generated by this target.
CMakeFiles/install-build-scripts.dir/build: install-build-scripts

.PHONY : CMakeFiles/install-build-scripts.dir/build

CMakeFiles/install-build-scripts.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/install-build-scripts.dir/cmake_clean.cmake
.PHONY : CMakeFiles/install-build-scripts.dir/clean

CMakeFiles/install-build-scripts.dir/depend:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par/CMakeFiles/install-build-scripts.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/install-build-scripts.dir/depend


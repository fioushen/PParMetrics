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
CMAKE_BINARY_DIR = /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp

# Include any dependencies generated for this target.
include UA/CMakeFiles/ua.dir/depend.make

# Include the progress variables for this target.
include UA/CMakeFiles/ua.dir/progress.make

# Include the compile flags for this target's objects.
include UA/CMakeFiles/ua.dir/flags.make

UA/CMakeFiles/ua.dir/src/adapt.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/adapt.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/adapt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object UA/CMakeFiles/ua.dir/src/adapt.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/adapt.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/adapt.c

UA/CMakeFiles/ua.dir/src/adapt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/adapt.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/adapt.c > CMakeFiles/ua.dir/src/adapt.c.i

UA/CMakeFiles/ua.dir/src/adapt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/adapt.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/adapt.c -o CMakeFiles/ua.dir/src/adapt.c.s

UA/CMakeFiles/ua.dir/src/convect.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/convect.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/convect.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object UA/CMakeFiles/ua.dir/src/convect.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/convect.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/convect.c

UA/CMakeFiles/ua.dir/src/convect.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/convect.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/convect.c > CMakeFiles/ua.dir/src/convect.c.i

UA/CMakeFiles/ua.dir/src/convect.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/convect.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/convect.c -o CMakeFiles/ua.dir/src/convect.c.s

UA/CMakeFiles/ua.dir/src/diffuse.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/diffuse.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/diffuse.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object UA/CMakeFiles/ua.dir/src/diffuse.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/diffuse.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/diffuse.c

UA/CMakeFiles/ua.dir/src/diffuse.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/diffuse.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/diffuse.c > CMakeFiles/ua.dir/src/diffuse.c.i

UA/CMakeFiles/ua.dir/src/diffuse.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/diffuse.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/diffuse.c -o CMakeFiles/ua.dir/src/diffuse.c.s

UA/CMakeFiles/ua.dir/src/mason.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/mason.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/mason.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object UA/CMakeFiles/ua.dir/src/mason.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/mason.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/mason.c

UA/CMakeFiles/ua.dir/src/mason.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/mason.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/mason.c > CMakeFiles/ua.dir/src/mason.c.i

UA/CMakeFiles/ua.dir/src/mason.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/mason.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/mason.c -o CMakeFiles/ua.dir/src/mason.c.s

UA/CMakeFiles/ua.dir/src/move.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/move.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/move.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object UA/CMakeFiles/ua.dir/src/move.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/move.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/move.c

UA/CMakeFiles/ua.dir/src/move.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/move.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/move.c > CMakeFiles/ua.dir/src/move.c.i

UA/CMakeFiles/ua.dir/src/move.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/move.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/move.c -o CMakeFiles/ua.dir/src/move.c.s

UA/CMakeFiles/ua.dir/src/precond.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/precond.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/precond.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object UA/CMakeFiles/ua.dir/src/precond.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/precond.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/precond.c

UA/CMakeFiles/ua.dir/src/precond.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/precond.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/precond.c > CMakeFiles/ua.dir/src/precond.c.i

UA/CMakeFiles/ua.dir/src/precond.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/precond.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/precond.c -o CMakeFiles/ua.dir/src/precond.c.s

UA/CMakeFiles/ua.dir/src/setup.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/setup.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/setup.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object UA/CMakeFiles/ua.dir/src/setup.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/setup.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/setup.c

UA/CMakeFiles/ua.dir/src/setup.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/setup.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/setup.c > CMakeFiles/ua.dir/src/setup.c.i

UA/CMakeFiles/ua.dir/src/setup.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/setup.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/setup.c -o CMakeFiles/ua.dir/src/setup.c.s

UA/CMakeFiles/ua.dir/src/transfer.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/transfer.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/transfer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object UA/CMakeFiles/ua.dir/src/transfer.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/transfer.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/transfer.c

UA/CMakeFiles/ua.dir/src/transfer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/transfer.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/transfer.c > CMakeFiles/ua.dir/src/transfer.c.i

UA/CMakeFiles/ua.dir/src/transfer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/transfer.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/transfer.c -o CMakeFiles/ua.dir/src/transfer.c.s

UA/CMakeFiles/ua.dir/src/ua.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/ua.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/ua.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object UA/CMakeFiles/ua.dir/src/ua.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/ua.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/ua.c

UA/CMakeFiles/ua.dir/src/ua.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/ua.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/ua.c > CMakeFiles/ua.dir/src/ua.c.i

UA/CMakeFiles/ua.dir/src/ua.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/ua.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/ua.c -o CMakeFiles/ua.dir/src/ua.c.s

UA/CMakeFiles/ua.dir/src/utils.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/utils.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/utils.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object UA/CMakeFiles/ua.dir/src/utils.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/utils.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/utils.c

UA/CMakeFiles/ua.dir/src/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/utils.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/utils.c > CMakeFiles/ua.dir/src/utils.c.i

UA/CMakeFiles/ua.dir/src/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/utils.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/utils.c -o CMakeFiles/ua.dir/src/utils.c.s

UA/CMakeFiles/ua.dir/src/verify.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/src/verify.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/verify.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object UA/CMakeFiles/ua.dir/src/verify.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/src/verify.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/verify.c

UA/CMakeFiles/ua.dir/src/verify.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/src/verify.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/verify.c > CMakeFiles/ua.dir/src/verify.c.i

UA/CMakeFiles/ua.dir/src/verify.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/src/verify.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA/src/verify.c -o CMakeFiles/ua.dir/src/verify.c.s

UA/CMakeFiles/ua.dir/__/common/c_print_results.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/__/common/c_print_results.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object UA/CMakeFiles/ua.dir/__/common/c_print_results.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/__/common/c_print_results.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c

UA/CMakeFiles/ua.dir/__/common/c_print_results.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/__/common/c_print_results.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c > CMakeFiles/ua.dir/__/common/c_print_results.c.i

UA/CMakeFiles/ua.dir/__/common/c_print_results.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/__/common/c_print_results.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c -o CMakeFiles/ua.dir/__/common/c_print_results.c.s

UA/CMakeFiles/ua.dir/__/common/c_timers.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/__/common/c_timers.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object UA/CMakeFiles/ua.dir/__/common/c_timers.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/__/common/c_timers.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c

UA/CMakeFiles/ua.dir/__/common/c_timers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/__/common/c_timers.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c > CMakeFiles/ua.dir/__/common/c_timers.c.i

UA/CMakeFiles/ua.dir/__/common/c_timers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/__/common/c_timers.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c -o CMakeFiles/ua.dir/__/common/c_timers.c.s

UA/CMakeFiles/ua.dir/__/common/print_results.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/__/common/print_results.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object UA/CMakeFiles/ua.dir/__/common/print_results.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/__/common/print_results.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c

UA/CMakeFiles/ua.dir/__/common/print_results.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/__/common/print_results.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c > CMakeFiles/ua.dir/__/common/print_results.c.i

UA/CMakeFiles/ua.dir/__/common/print_results.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/__/common/print_results.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c -o CMakeFiles/ua.dir/__/common/print_results.c.s

UA/CMakeFiles/ua.dir/__/common/wtime.c.o: UA/CMakeFiles/ua.dir/flags.make
UA/CMakeFiles/ua.dir/__/common/wtime.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object UA/CMakeFiles/ua.dir/__/common/wtime.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ua.dir/__/common/wtime.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c

UA/CMakeFiles/ua.dir/__/common/wtime.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ua.dir/__/common/wtime.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c > CMakeFiles/ua.dir/__/common/wtime.c.i

UA/CMakeFiles/ua.dir/__/common/wtime.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ua.dir/__/common/wtime.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c -o CMakeFiles/ua.dir/__/common/wtime.c.s

# Object files for target ua
ua_OBJECTS = \
"CMakeFiles/ua.dir/src/adapt.c.o" \
"CMakeFiles/ua.dir/src/convect.c.o" \
"CMakeFiles/ua.dir/src/diffuse.c.o" \
"CMakeFiles/ua.dir/src/mason.c.o" \
"CMakeFiles/ua.dir/src/move.c.o" \
"CMakeFiles/ua.dir/src/precond.c.o" \
"CMakeFiles/ua.dir/src/setup.c.o" \
"CMakeFiles/ua.dir/src/transfer.c.o" \
"CMakeFiles/ua.dir/src/ua.c.o" \
"CMakeFiles/ua.dir/src/utils.c.o" \
"CMakeFiles/ua.dir/src/verify.c.o" \
"CMakeFiles/ua.dir/__/common/c_print_results.c.o" \
"CMakeFiles/ua.dir/__/common/c_timers.c.o" \
"CMakeFiles/ua.dir/__/common/print_results.c.o" \
"CMakeFiles/ua.dir/__/common/wtime.c.o"

# External object files for target ua
ua_EXTERNAL_OBJECTS =

UA/ua: UA/CMakeFiles/ua.dir/src/adapt.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/convect.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/diffuse.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/mason.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/move.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/precond.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/setup.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/transfer.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/ua.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/utils.c.o
UA/ua: UA/CMakeFiles/ua.dir/src/verify.c.o
UA/ua: UA/CMakeFiles/ua.dir/__/common/c_print_results.c.o
UA/ua: UA/CMakeFiles/ua.dir/__/common/c_timers.c.o
UA/ua: UA/CMakeFiles/ua.dir/__/common/print_results.c.o
UA/ua: UA/CMakeFiles/ua.dir/__/common/wtime.c.o
UA/ua: UA/CMakeFiles/ua.dir/build.make
UA/ua: UA/CMakeFiles/ua.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking C executable ua"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ua.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
UA/CMakeFiles/ua.dir/build: UA/ua

.PHONY : UA/CMakeFiles/ua.dir/build

UA/CMakeFiles/ua.dir/clean:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA && $(CMAKE_COMMAND) -P CMakeFiles/ua.dir/cmake_clean.cmake
.PHONY : UA/CMakeFiles/ua.dir/clean

UA/CMakeFiles/ua.dir/depend:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/UA /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-perf-run/icc-perf-vec-par-omp/UA/CMakeFiles/ua.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : UA/CMakeFiles/ua.dir/depend


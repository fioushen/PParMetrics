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
CMAKE_BINARY_DIR = /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run

# Include any dependencies generated for this target.
include BT/CMakeFiles/bt.dir/depend.make

# Include the progress variables for this target.
include BT/CMakeFiles/bt.dir/progress.make

# Include the compile flags for this target's objects.
include BT/CMakeFiles/bt.dir/flags.make

BT/CMakeFiles/bt.dir/src/add.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/add.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/add.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object BT/CMakeFiles/bt.dir/src/add.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/add.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/add.c

BT/CMakeFiles/bt.dir/src/add.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/add.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/add.c > CMakeFiles/bt.dir/src/add.c.i

BT/CMakeFiles/bt.dir/src/add.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/add.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/add.c -o CMakeFiles/bt.dir/src/add.c.s

BT/CMakeFiles/bt.dir/src/adi.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/adi.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/adi.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object BT/CMakeFiles/bt.dir/src/adi.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/adi.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/adi.c

BT/CMakeFiles/bt.dir/src/adi.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/adi.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/adi.c > CMakeFiles/bt.dir/src/adi.c.i

BT/CMakeFiles/bt.dir/src/adi.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/adi.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/adi.c -o CMakeFiles/bt.dir/src/adi.c.s

BT/CMakeFiles/bt.dir/src/bt.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/bt.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/bt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object BT/CMakeFiles/bt.dir/src/bt.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/bt.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/bt.c

BT/CMakeFiles/bt.dir/src/bt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/bt.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/bt.c > CMakeFiles/bt.dir/src/bt.c.i

BT/CMakeFiles/bt.dir/src/bt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/bt.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/bt.c -o CMakeFiles/bt.dir/src/bt.c.s

BT/CMakeFiles/bt.dir/src/error.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/error.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/error.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object BT/CMakeFiles/bt.dir/src/error.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/error.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/error.c

BT/CMakeFiles/bt.dir/src/error.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/error.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/error.c > CMakeFiles/bt.dir/src/error.c.i

BT/CMakeFiles/bt.dir/src/error.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/error.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/error.c -o CMakeFiles/bt.dir/src/error.c.s

BT/CMakeFiles/bt.dir/src/exact_rhs.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/exact_rhs.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/exact_rhs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object BT/CMakeFiles/bt.dir/src/exact_rhs.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/exact_rhs.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/exact_rhs.c

BT/CMakeFiles/bt.dir/src/exact_rhs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/exact_rhs.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/exact_rhs.c > CMakeFiles/bt.dir/src/exact_rhs.c.i

BT/CMakeFiles/bt.dir/src/exact_rhs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/exact_rhs.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/exact_rhs.c -o CMakeFiles/bt.dir/src/exact_rhs.c.s

BT/CMakeFiles/bt.dir/src/exact_solution.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/exact_solution.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/exact_solution.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object BT/CMakeFiles/bt.dir/src/exact_solution.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/exact_solution.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/exact_solution.c

BT/CMakeFiles/bt.dir/src/exact_solution.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/exact_solution.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/exact_solution.c > CMakeFiles/bt.dir/src/exact_solution.c.i

BT/CMakeFiles/bt.dir/src/exact_solution.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/exact_solution.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/exact_solution.c -o CMakeFiles/bt.dir/src/exact_solution.c.s

BT/CMakeFiles/bt.dir/src/initialize.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/initialize.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/initialize.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object BT/CMakeFiles/bt.dir/src/initialize.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/initialize.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/initialize.c

BT/CMakeFiles/bt.dir/src/initialize.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/initialize.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/initialize.c > CMakeFiles/bt.dir/src/initialize.c.i

BT/CMakeFiles/bt.dir/src/initialize.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/initialize.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/initialize.c -o CMakeFiles/bt.dir/src/initialize.c.s

BT/CMakeFiles/bt.dir/src/rhs.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/rhs.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/rhs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object BT/CMakeFiles/bt.dir/src/rhs.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/rhs.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/rhs.c

BT/CMakeFiles/bt.dir/src/rhs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/rhs.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/rhs.c > CMakeFiles/bt.dir/src/rhs.c.i

BT/CMakeFiles/bt.dir/src/rhs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/rhs.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/rhs.c -o CMakeFiles/bt.dir/src/rhs.c.s

BT/CMakeFiles/bt.dir/src/set_constants.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/set_constants.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/set_constants.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object BT/CMakeFiles/bt.dir/src/set_constants.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/set_constants.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/set_constants.c

BT/CMakeFiles/bt.dir/src/set_constants.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/set_constants.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/set_constants.c > CMakeFiles/bt.dir/src/set_constants.c.i

BT/CMakeFiles/bt.dir/src/set_constants.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/set_constants.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/set_constants.c -o CMakeFiles/bt.dir/src/set_constants.c.s

BT/CMakeFiles/bt.dir/src/solve_subs.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/solve_subs.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/solve_subs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object BT/CMakeFiles/bt.dir/src/solve_subs.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/solve_subs.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/solve_subs.c

BT/CMakeFiles/bt.dir/src/solve_subs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/solve_subs.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/solve_subs.c > CMakeFiles/bt.dir/src/solve_subs.c.i

BT/CMakeFiles/bt.dir/src/solve_subs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/solve_subs.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/solve_subs.c -o CMakeFiles/bt.dir/src/solve_subs.c.s

BT/CMakeFiles/bt.dir/src/verify.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/verify.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/verify.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object BT/CMakeFiles/bt.dir/src/verify.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/verify.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/verify.c

BT/CMakeFiles/bt.dir/src/verify.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/verify.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/verify.c > CMakeFiles/bt.dir/src/verify.c.i

BT/CMakeFiles/bt.dir/src/verify.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/verify.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/verify.c -o CMakeFiles/bt.dir/src/verify.c.s

BT/CMakeFiles/bt.dir/src/x_solve.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/x_solve.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/x_solve.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object BT/CMakeFiles/bt.dir/src/x_solve.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/x_solve.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/x_solve.c

BT/CMakeFiles/bt.dir/src/x_solve.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/x_solve.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/x_solve.c > CMakeFiles/bt.dir/src/x_solve.c.i

BT/CMakeFiles/bt.dir/src/x_solve.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/x_solve.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/x_solve.c -o CMakeFiles/bt.dir/src/x_solve.c.s

BT/CMakeFiles/bt.dir/src/y_solve.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/y_solve.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/y_solve.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object BT/CMakeFiles/bt.dir/src/y_solve.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/y_solve.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/y_solve.c

BT/CMakeFiles/bt.dir/src/y_solve.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/y_solve.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/y_solve.c > CMakeFiles/bt.dir/src/y_solve.c.i

BT/CMakeFiles/bt.dir/src/y_solve.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/y_solve.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/y_solve.c -o CMakeFiles/bt.dir/src/y_solve.c.s

BT/CMakeFiles/bt.dir/src/z_solve.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/src/z_solve.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/z_solve.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object BT/CMakeFiles/bt.dir/src/z_solve.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/src/z_solve.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/z_solve.c

BT/CMakeFiles/bt.dir/src/z_solve.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/src/z_solve.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/z_solve.c > CMakeFiles/bt.dir/src/z_solve.c.i

BT/CMakeFiles/bt.dir/src/z_solve.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/src/z_solve.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT/src/z_solve.c -o CMakeFiles/bt.dir/src/z_solve.c.s

BT/CMakeFiles/bt.dir/__/common/c_print_results.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/__/common/c_print_results.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object BT/CMakeFiles/bt.dir/__/common/c_print_results.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/__/common/c_print_results.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c

BT/CMakeFiles/bt.dir/__/common/c_print_results.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/__/common/c_print_results.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c > CMakeFiles/bt.dir/__/common/c_print_results.c.i

BT/CMakeFiles/bt.dir/__/common/c_print_results.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/__/common/c_print_results.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_print_results.c -o CMakeFiles/bt.dir/__/common/c_print_results.c.s

BT/CMakeFiles/bt.dir/__/common/c_timers.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/__/common/c_timers.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object BT/CMakeFiles/bt.dir/__/common/c_timers.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/__/common/c_timers.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c

BT/CMakeFiles/bt.dir/__/common/c_timers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/__/common/c_timers.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c > CMakeFiles/bt.dir/__/common/c_timers.c.i

BT/CMakeFiles/bt.dir/__/common/c_timers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/__/common/c_timers.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/c_timers.c -o CMakeFiles/bt.dir/__/common/c_timers.c.s

BT/CMakeFiles/bt.dir/__/common/print_results.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/__/common/print_results.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object BT/CMakeFiles/bt.dir/__/common/print_results.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/__/common/print_results.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c

BT/CMakeFiles/bt.dir/__/common/print_results.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/__/common/print_results.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c > CMakeFiles/bt.dir/__/common/print_results.c.i

BT/CMakeFiles/bt.dir/__/common/print_results.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/__/common/print_results.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/print_results.c -o CMakeFiles/bt.dir/__/common/print_results.c.s

BT/CMakeFiles/bt.dir/__/common/wtime.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/__/common/wtime.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building C object BT/CMakeFiles/bt.dir/__/common/wtime.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/__/common/wtime.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c

BT/CMakeFiles/bt.dir/__/common/wtime.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/__/common/wtime.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c > CMakeFiles/bt.dir/__/common/wtime.c.i

BT/CMakeFiles/bt.dir/__/common/wtime.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/__/common/wtime.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/wtime.c -o CMakeFiles/bt.dir/__/common/wtime.c.s

BT/CMakeFiles/bt.dir/__/common/randdp.c.o: BT/CMakeFiles/bt.dir/flags.make
BT/CMakeFiles/bt.dir/__/common/randdp.c.o: /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/randdp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building C object BT/CMakeFiles/bt.dir/__/common/randdp.c.o"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bt.dir/__/common/randdp.c.o   -c /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/randdp.c

BT/CMakeFiles/bt.dir/__/common/randdp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bt.dir/__/common/randdp.c.i"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/randdp.c > CMakeFiles/bt.dir/__/common/randdp.c.i

BT/CMakeFiles/bt.dir/__/common/randdp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bt.dir/__/common/randdp.c.s"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && /opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64/icc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/common/randdp.c -o CMakeFiles/bt.dir/__/common/randdp.c.s

# Object files for target bt
bt_OBJECTS = \
"CMakeFiles/bt.dir/src/add.c.o" \
"CMakeFiles/bt.dir/src/adi.c.o" \
"CMakeFiles/bt.dir/src/bt.c.o" \
"CMakeFiles/bt.dir/src/error.c.o" \
"CMakeFiles/bt.dir/src/exact_rhs.c.o" \
"CMakeFiles/bt.dir/src/exact_solution.c.o" \
"CMakeFiles/bt.dir/src/initialize.c.o" \
"CMakeFiles/bt.dir/src/rhs.c.o" \
"CMakeFiles/bt.dir/src/set_constants.c.o" \
"CMakeFiles/bt.dir/src/solve_subs.c.o" \
"CMakeFiles/bt.dir/src/verify.c.o" \
"CMakeFiles/bt.dir/src/x_solve.c.o" \
"CMakeFiles/bt.dir/src/y_solve.c.o" \
"CMakeFiles/bt.dir/src/z_solve.c.o" \
"CMakeFiles/bt.dir/__/common/c_print_results.c.o" \
"CMakeFiles/bt.dir/__/common/c_timers.c.o" \
"CMakeFiles/bt.dir/__/common/print_results.c.o" \
"CMakeFiles/bt.dir/__/common/wtime.c.o" \
"CMakeFiles/bt.dir/__/common/randdp.c.o"

# External object files for target bt
bt_EXTERNAL_OBJECTS =

BT/bt: BT/CMakeFiles/bt.dir/src/add.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/adi.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/bt.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/error.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/exact_rhs.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/exact_solution.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/initialize.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/rhs.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/set_constants.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/solve_subs.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/verify.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/x_solve.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/y_solve.c.o
BT/bt: BT/CMakeFiles/bt.dir/src/z_solve.c.o
BT/bt: BT/CMakeFiles/bt.dir/__/common/c_print_results.c.o
BT/bt: BT/CMakeFiles/bt.dir/__/common/c_timers.c.o
BT/bt: BT/CMakeFiles/bt.dir/__/common/print_results.c.o
BT/bt: BT/CMakeFiles/bt.dir/__/common/wtime.c.o
BT/bt: BT/CMakeFiles/bt.dir/__/common/randdp.c.o
BT/bt: BT/CMakeFiles/bt.dir/build.make
BT/bt: BT/CMakeFiles/bt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Linking C executable bt"
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
BT/CMakeFiles/bt.dir/build: BT/bt

.PHONY : BT/CMakeFiles/bt.dir/build

BT/CMakeFiles/bt.dir/clean:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT && $(CMAKE_COMMAND) -P CMakeFiles/bt.dir/cmake_clean.cmake
.PHONY : BT/CMakeFiles/bt.dir/clean

BT/CMakeFiles/bt.dir/depend:
	cd /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp /home/s1736883/Work/PParMetrics/benchmarks/snu-npb/nauseous-omp/BT /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT /home/s1736883/Work/PParMetrics/benchmarks-run/snu-npb-run/icc-report-run/icc-par-report-run/BT/CMakeFiles/bt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : BT/CMakeFiles/bt.dir/depend


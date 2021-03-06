#!/bin/bash

source $(dirname "$0")/../include/project-environment.sh

echo "< build-nas-benchmarks-run-dir.sh script >"
echo "=> Building NAS benchmarks running directory!"

C_FLAGS=""

if [[ ! -e ${BENCHMARKS_RUN_DIR} ]]; then
    mkdir ${BENCHMARKS_RUN_DIR}
fi

# clean up all the previous builds 
if [[ -e ${NAS_BENCHMARKS_RUN_DIR} ]]; then
    rm -rf ${NAS_BENCHMARKS_RUN_DIR}
fi
mkdir ${NAS_BENCHMARKS_RUN_DIR}

# [1] create symbolic links from the nauseous NAS benchmark build harness to NAS benchmark C source code
(
echo "=> Creating symbolic links from NAS CMake build harness to SNU NAS C sources"
ORIGINAL_PATH=$PATH
# SERIAL NAS BENCHMARKS
# make dedicated script visible from the shell
export PATH=${ORIGINAL_PATH}:${NAUSEOUS_SER_HARNESS_DIR}/utils/scripts/source_tree/
cd ${NAUSEOUS_SER_HARNESS_DIR}
create-symlink-bmk-subdir.sh \
    -c ${NAUSEOUS_SER_HARNESS_DIR}/config/suite_all.txt \
    -s ${NAS_SER_SOURCES_DIR} \
    -t ${NAUSEOUS_SER_HARNESS_DIR} \
    -l src
# PARALLEL NAS BENCHMARKS
export PATH=${ORIGINAL_PATH}:${NAUSEOUS_OMP_HARNESS_DIR}/utils/scripts/source_tree/
cd ${NAUSEOUS_OMP_HARNESS_DIR}
create-symlink-bmk-subdir.sh \
    -c ${NAUSEOUS_OMP_HARNESS_DIR}/config/suite_all.txt \
    -s ${NAS_OMP_SOURCES_DIR} \
    -t ${NAUSEOUS_OMP_HARNESS_DIR} \
    -l src
)

# [2] generate CMake-based testing system
(
echo "=> Generating CMake-based testing system"
# use OMP version for correct [source_file:line] loop labels
ORIGINAL_PATH=$PATH
export PATH=${ORIGINAL_PATH}:${NAUSEOUS_OMP_HARNESS_DIR}/utils/scripts/source_tree/

if [[ -e ${NAS_PPAR_METRICS_RUN_DIR} ]]; then
    rm -rf ${NAS_PPAR_METRICS_RUN_DIR}
fi
mkdir ${NAS_PPAR_METRICS_RUN_DIR}

if [[ -e ${NAS_ICC_REPORT_RUN_DIR} ]]; then
    rm -rf ${NAS_ICC_REPORT_RUN_DIR}
fi
mkdir ${NAS_ICC_REPORT_RUN_DIR}

if [[ -e ${NAS_ICC_PAR_REPORT_RUN_DIR} ]]; then
    rm -rf ${NAS_ICC_PAR_REPORT_RUN_DIR}
fi
mkdir ${NAS_ICC_PAR_REPORT_RUN_DIR}

if [[ -e ${NAS_ICC_PROF_REPORT_RUN_DIR} ]]; then
    rm -rf ${NAS_ICC_PROF_REPORT_RUN_DIR}
fi
mkdir ${NAS_ICC_PROF_REPORT_RUN_DIR}

if [[ -e ${NAS_ICC_PERF_RUN_DIR} ]]; then
    rm -rf ${NAS_ICC_PERF_RUN_DIR}
fi
mkdir ${NAS_ICC_PERF_RUN_DIR}

echo "=> Generating CMake-based system for running PPar metrics tool on SNU NPB benchmarks"
echo "DIR: ${NAS_PPAR_METRICS_RUN_DIR}"
cd ${NAS_PPAR_METRICS_RUN_DIR} 
build-llvm-ppar-metrics.sh

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks with ICC compiler optimization reports"
echo "DIR: ${NAS_ICC_PAR_REPORT_RUN_DIR}"
cd ${NAS_ICC_PAR_REPORT_RUN_DIR} 
build-icc-ppar-report.sh

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks with ICC compiler profiling reports"
echo "DIR: ${NAS_ICC_PROF_REPORT_RUN_DIR}"
cd ${NAS_ICC_PROF_REPORT_RUN_DIR} 
build-icc-loop-profile.sh

if [[ -e ${NAS_ICC_PERF_SER_DIR} ]]; then
    rm -rf ${NAS_ICC_PERF_SER_DIR}
fi
mkdir ${NAS_ICC_PERF_SER_DIR}

if [[ -e ${NAS_ICC_PERF_VEC_DIR} ]]; then
    rm -rf ${NAS_ICC_PERF_VEC_DIR}
fi
mkdir ${NAS_ICC_PERF_VEC_DIR}

if [[ -e ${NAS_ICC_PERF_PAR_DIR} ]]; then
    rm -rf ${NAS_ICC_PERF_PAR_DIR}
fi
mkdir ${NAS_ICC_PERF_PAR_DIR}

if [[ -e ${NAS_ICC_PERF_VEC_PAR_DIR} ]]; then
    rm -rf ${NAS_ICC_PERF_VEC_PAR_DIR}
fi
mkdir ${NAS_ICC_PERF_VEC_PAR_DIR}

if [[ -e ${NAS_ICC_PERF_VEC_OMP_DIR} ]]; then
    rm -rf ${NAS_ICC_PERF_VEC_OMP_DIR}
fi
mkdir ${NAS_ICC_PERF_VEC_OMP_DIR}

if [[ -e ${NAS_ICC_PERF_PAR_OMP_DIR} ]]; then
    rm -rf ${NAS_ICC_PERF_PAR_OMP_DIR}
fi
mkdir ${NAS_ICC_PERF_PAR_OMP_DIR}

if [[ -e ${NAS_ICC_PERF_OMP_DIR} ]]; then
    rm -rf ${NAS_ICC_PERF_OMP_DIR}
fi
mkdir ${NAS_ICC_PERF_OMP_DIR}

if [[ -e ${NAS_ICC_PERF_VEC_PAR_OMP_DIR} ]]; then
    rm -rf ${NAS_ICC_PERF_VEC_PAR_OMP_DIR}
fi
mkdir ${NAS_ICC_PERF_VEC_PAR_OMP_DIR}

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks into serial version with ICC compiler for performance run"
echo "DIR: ${NAS_ICC_PERF_SER_DIR}"
cd ${NAS_ICC_PERF_SER_DIR} 
build-icc-perf-ser.sh

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks into vector version with ICC compiler for performance run"
echo "DIR: ${NAS_ICC_PERF_VEC_DIR}"
cd ${NAS_ICC_PERF_VEC_DIR} 
build-icc-perf-vec.sh

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks into parallel version with ICC compiler for performance run"
echo "DIR: ${NAS_ICC_PERF_PAR_DIR}"
cd ${NAS_ICC_PERF_PAR_DIR} 
build-icc-perf-par.sh

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks into vector+parallel version with ICC compiler for performance run"
echo "DIR: ${NAS_ICC_PERF_VEC_PAR_DIR}"
cd ${NAS_ICC_PERF_VEC_PAR_DIR} 
build-icc-perf-vec-par.sh

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks into vector+omp version with ICC compiler for performance run"
echo "DIR: ${NAS_ICC_PERF_VEC_OMP_DIR}"
cd ${NAS_ICC_PERF_VEC_OMP_DIR} 
build-icc-perf-vec-omp.sh

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks into parallel+omp version with ICC compiler for performance run"
echo "DIR: ${NAS_ICC_PERF_PAR_OMP_DIR}"
cd ${NAS_ICC_PERF_PAR_OMP_DIR} 
build-icc-perf-par-omp.sh

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks into OpenMP version with ICC compiler for performance run"
echo "DIR: ${NAS_ICC_PERF_OMP_DIR}"
cd ${NAS_ICC_PERF_OMP_DIR} 
build-icc-perf-omp.sh

echo "=> Generating CMake-based system for compiling SNU NPB benchmarks into vector+parallel+openmp with OpenMP version with ICC compiler for performance run"
echo "DIR: ${NAS_ICC_PERF_VEC_PAR_OMP_DIR}"
cd ${NAS_ICC_PERF_VEC_PAR_OMP_DIR} 
build-icc-perf-vec-par-omp.sh
)

echo "=> NAS benchmarks prebuilding script finished!"

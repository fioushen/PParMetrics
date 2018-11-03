#!/bin/bash

source $(dirname "$0")/project-environment.sh

echo "< clean.sh script >"
echo "Cleaning up all reports, builds, runs!"

# delete all autogenerated benchmark run directories
# benchmark run parent directory removal is enough
if [[ -e ${BENCHMARKS_RUN_DIR} ]]; then
    rm -rf ${BENCHMARKS_RUN_DIR}
    echo "Deleted ${BENCHMARKS_RUN_DIR}"
fi

# delete all autogenerated directories with PPar reports and results
for dir in ${PPAR_REPORTS_DIRS[@]}; do
    if [[ -e ${dir} ]]; then
        rm -rf ${dir}
        echo "Deleted ${dir}"
    fi
done

if [[ -e ${PPAR_TOOL_BUILD_DIR} ]]; then
    rm -rf ${PPAR_TOOL_BUILD_DIR}
fi

echo "Cleaning script finished!"

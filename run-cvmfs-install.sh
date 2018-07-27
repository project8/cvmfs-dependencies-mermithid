#!/bin/bash

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# call the setup script to establish all necessary environment variables
source ${SCRIPT_DIR}/setup.sh

# make the dependencies build directory
mkdir -p ${P8DEPMERMITHIDBASEDIR}

# copy in the necessary scripts
mv ${SCRIPT_DIR}/setup.sh ${P8DEPMERMITHIDBASEDIR}/setup.sh
mv ${SCRIPT_DIR}/dependency_urls.txt ${P8DEPMERMITHIDBASEDIR}/dependency_urls.txt
mv ${SCRIPT_DIR}/download_pkg.sh ${P8DEPMERMITHIDBASEDIR}/download_pkg.sh
mv ${SCRIPT_DIR}/install.sh ${P8DEPMERMITHIDBASEDIR}/install.sh
mv ${SCRIPT_DIR}/python_tester.py ${P8DEPMERMITHIDBASEDIR}/python_tester.py

# run the download and install scripts
${P8DEPMERMITHIDBASEDIR}/download_pkg.sh | tee ${P8DEPMERMITHIDBASEDIR}/download_log
${P8DEPMERMITHIDBASEDIR}/install.sh | tee ${P8DEPMERMITHIDBASEDIR}/install_log

#!/bin/bash

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# call the setup script to establish all necessary environment variables
source ${SCRIPT_DIR}/setup.sh

# make the dependencies build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}

# copy in the necessary scripts
mv ${SCRIPT_DIR}/setup.sh /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/setup.sh
mv ${SCRIPT_DIR}/dependency_urls.txt /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/dependency_urls.txt
mv ${SCRIPT_DIR}/download_pkg.sh /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/download_pkg.sh
mv ${SCRIPT_DIR}/install.sh /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/install.sh
mv ${SCRIPT_DIR}/python_tester.py /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/python_tester.py

# run the download and install scripts
chmod +x /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/download_pkg.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/install.sh
/cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/download_pkg.sh
/cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/install.sh

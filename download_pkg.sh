#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/setup.sh

########################################################################
#
# collect source distributions for all dependencies
#
########################################################################

# get into the parent directory for all the source code and build proucts
cd ${P8DEPMERMITHIDBASEDIR}
mkdir src
cd src/
pwd


# download current (on 2015/09/16) versions of all dependencies
echo "Downloading source files"
wget --input-file=${P8DEPMERMITHIDBASEDIR}/dependency_urls.txt --output-file=wget_log.txt --tries=3
echo "Download: complete!"
cat wget_log.txt
ls

gunzip libpng-1.6.34.tar.gz             # libpng
tar -xf libpng-1.6.34.tar
ln -s libpng-1.6.34 libpng
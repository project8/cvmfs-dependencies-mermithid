# FROM project8/cvmfs-dependencies:latest

export P8DEPMORPHOBUILD=build-2017-10-18

# get the location of this script
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# make the dependencies build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}
# rm -f /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/latest 
# ln -s /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD} /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/latest

cp ./setup.sh /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/setup.sh
cp ./install.sh /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/install.sh
cp ./python_tester.py /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/python_tester.py

source /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/setup.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/install.sh
/cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/install.sh

# FROM project8/cvmfs-dependencies:latest

export P8DEPPYBUILD=build-2017-10-18

# get the location of this script
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# make the dependencies build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}
rm -f /cvmfs/hep.pnnl.gov/project8/dependencies-py/latest 
ln -s /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} /cvmfs/hep.pnnl.gov/project8/dependencies-py/latest

cp ./setup.sh /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/setup.sh
cp ./install.sh /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/install.sh
cp ./python_tester.py /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/python_tester.py

source /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/setup.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/install.sh
/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD}/install.sh

#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/dependencies-py/latest/setup.sh

echo `which python`
echo `python -V`

echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "PATH: $PATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`

#######################################################################
#
# build all python packages
#
########################################################################

# Get pip and setuptools
echo 'Python packages'
cd /cvmfs/hep.pnnl.gov/project8/dependencies-py/latest
wget https://bootstrap.pypa.io/get-pip.py
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} setuptools pip wheel 

# Install Python packages
# For morpho
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} colorlog 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} PyYAML==3.11 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} pyparsing>=2.1.5 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} dnspython==1.12.0 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} pbr==0.10.8 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} wsgiref==0.1.2 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} cycler==0.10.0 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} matplotlib==1.5.1 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} pystan==2.15.0.1 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} h5py==2.6 
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} numpy==1.13.1
python  get-pip.py --prefix=/cvmfs/hep.pnnl.gov/project8/dependencies-py/${P8DEPPYBUILD} python-dateutil==2.5.3

# Test the presence of ROOT and HDF5
python /cvmfs/hep.pnnl.gov/project8/dependencies-py/latest/python_tester.py 

source /cvmfs/hep.pnnl.gov/project8/dependencies/${P8DEPBUILD}/setup.sh

export P8DEPPYBASEDIR=${P8BASEDIR}/dependencies-py/${P8DEPPYBUILD}

export PYTHONPATH=${P8DEPPYBASEDIR}/lib/python2.7/site-packages:${PYTHONPATH} 
export PATH=${P8DEPPYBASEDIR}/bin:${PATH} 




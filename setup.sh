# setting dependencies and dep-morpho build name
export P8DEPBUILD=build-2018-04-17
export P8DEPMERMITHIDBUILD=build-2018-04-20

# source common dependencies 
source /cvmfs/hep.pnnl.gov/project8/dependencies-common/${P8DEPBUILD}/setup.sh

export P8DEPMERMITHIDBASEDIR=${P8BASEDIR}/dependencies-mermithid/${P8DEPMERMITHIDBUILD}

export PATH=${P8DEPMERMITHIDBASEDIR}/bin:${PATH}
export INCLUDE_PATH=${P8DEPMERMITHIDBASEDIR}/include:${INCLUDE_PATH}
export INCLUDE_PATH=${P8DEPMERMITHIDBASEDIR}/include/libpng16:${INCLUDE_PATH}
export LIBRARY_PATH=${P8DEPMERMITHIDBASEDIR}/lib:${LIBRARY_PATH}
export LIBRARY_PATH=${P8DEPMERMITHIDBASEDIR}/lib/libpng:${LIBRARY_PATH}
export LIBRARY_PATH=${P8DEPMERMITHIDBASEDIR}/lib64:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${P8DEPMERMITHIDBASEDIR}/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${P8DEPMERMITHIDBASEDIR}/lib/libpng:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${P8DEPMERMITHIDBASEDIR}/lib64:${LIBRARY_PATH}

export LIBDIR=${LD_LIBRARY_PATH}:${LIBDIR}

export PYTHONPATH=${P8DEPMERMITHIDBASEDIR}/lib/python3.6/site-packages:${PYTHONPATH} 
export PKG_CONFIG_PATH=${P8DEPMERMITHIDBASEDIR}/lib:${P8DEPMERMITHIDBASEDIR}/lib/pkgconfig:${PKG_CONFIG_PATH}





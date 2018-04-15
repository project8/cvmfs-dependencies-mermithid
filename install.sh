#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/setup.sh

echo `which python3`
echo `python3 -V`

echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "PATH: $PATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`

cd ${P8DEPMERMITHIDBASEDIR}/src/

# libpng
# echo "pkg-config"
# cd pkg-config
# ./configure --prefix=${P8DEPMERMITHIDBASEDIR} CC=$CC --with-internal-glib       | tee cmake_log.txt
# # ./configure --enable-shared --prefix=${P8DEPMERMITHIDBASEDIR} | tee config_log.txt
# make -j3                                             | tee make_log.txt
# make -j3 install                                     | tee make_install_log.txt
# cd ..

# libpng
echo "libpng"
cd libpng
cmake . -DCMAKE_INSTALL_PREFIX=${P8DEPMERMITHIDBASEDIR}       | tee cmake_log.txt
# ./configure --enable-shared --prefix=${P8DEPMERMITHIDBASEDIR} | tee config_log.txt
make -j3                                             | tee make_log.txt
make -j3 install                                     | tee make_install_log.txt
cd ..

rm -rf *

ls ${P8DEPMERMITHIDBASEDIR}/include

export PKG_CONFIG_PATH=${P8DEPMERMITHIDBASEDIR}/lib
ls ${P8DEPMERMITHIDBASEDIR}/lib

#######################################################################
#
# build all python3 packages
#
########################################################################

# Get pip and setuptools
echo 'python3 packages'
cd /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}
wget https://bootstrap.pypa.io/get-pip.py
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} setuptools pip wheel

# Install python3 packages
# For mermithid
# python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} colorlog 
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} PyYAML==3.11
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} pyparsing>=2.1.5
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} dnspython==1.12.0
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} pbr==0.10.8
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} cycler==0.10.0
python3 get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} colorlog==3.1.2
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} python-dateutil==2.7.2
echo "Putting symbolic links for installing matplotlib"
ln -s /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/include/png*.h /usr/include/
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} matplotlib==1.5.1
echo "Removing symbolic links after installing matplotlib"
rm /usr/include/png.h /usr/include/pngconf.h /usr/include/pnglibconf.h
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} pystan==2.17.0.0
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} h5py==2.6
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} numpy==1.14.2
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} uproot==2.8.16

# Test the presence of ROOT and HDF5
python3 /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/python_tester.py 

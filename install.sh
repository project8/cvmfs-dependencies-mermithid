#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/setup.sh

echo `which python`
echo `python -V`

echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "PATH: $PATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`

cd ${P8DEPMORPHOBASEDIR}/src/

# libpng
# echo "pkg-config"
# cd pkg-config
# ./configure --prefix=${P8DEPMORPHOBASEDIR} CC=$CC --with-internal-glib       | tee cmake_log.txt
# # ./configure --enable-shared --prefix=${P8DEPMORPHOBASEDIR} | tee config_log.txt
# make -j3                                             | tee make_log.txt
# make -j3 install                                     | tee make_install_log.txt
# cd ..

# libpng
echo "libpng"
cd libpng
cmake . -DCMAKE_INSTALL_PREFIX=${P8DEPMORPHOBASEDIR}       | tee cmake_log.txt
# ./configure --enable-shared --prefix=${P8DEPMORPHOBASEDIR} | tee config_log.txt
make -j3                                             | tee make_log.txt
make -j3 install                                     | tee make_install_log.txt
cd ..

rm -rf *

ls ${P8DEPMORPHOBASEDIR}/include

export PKG_CONFIG_PATH=${P8DEPMORPHOBASEDIR}/lib
ls ${P8DEPMORPHOBASEDIR}/lib

#######################################################################
#
# build all python packages
#
########################################################################

# Get pip and setuptools
echo 'Python packages'
cd /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}
wget https://bootstrap.pypa.io/get-pip.py
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} setuptools pip wheel 

# Install Python packages
# For morpho
# python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} colorlog 
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} PyYAML==3.11 
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} pyparsing>=2.1.5 
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} dnspython==1.12.0 
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} pbr==0.10.8 
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} wsgiref==0.1.2 
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} cycler==0.10.0 
python get-pip.py --prefix=${P8DEPMORPHOBASEDIR} colorlog==3.1.0
echo "Putting symbolic links for installing matplotlib"
ln -s /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/include/png*.h /usr/include/
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} matplotlib==1.5.1 
echo "Removing symbolic links after installing matplotlib"
rm /usr/include/png.h /usr/include/pngconf.h /usr/include/pnglibconf.h
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} pystan==2.15.0.1 
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} h5py==2.6 
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} numpy==1.13.1
python  get-pip.py --prefix=${P8DEPMORPHOBASEDIR} python-dateutil==2.5.3

# Test the presence of ROOT and HDF5
python /cvmfs/hep.pnnl.gov/project8/dependencies-morpho/${P8DEPMORPHOBUILD}/python_tester.py 

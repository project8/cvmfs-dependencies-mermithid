#!/bin/bash

# It's assumed that you've already sourced the relevant setup.sh


echo `which python3`
echo `python3 -V`

echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "PATH: $PATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`

# libpng
echo "libpng"
cd ${P8DEPMERMITHIDBASEDIR}/src/libpng
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${P8DEPMERMITHIDBASEDIR} \
      -D CMAKE_INSTALL_BINDIR:PATH=${P8DEPMERMITHIDBASEDIR}/bin \
      -D CMAKE_INSTALL_LIBDIR:PATH=${P8DEPMERMITHIDBASEDIR}/lib \
      -D CMAKE_INSTALL_INCLUDEDIR:PATH=${P8DEPMERMITHIDBASEDIR}/include  ..       | tee cmake_log.txt
make -j3                                             | tee make_log.txt
make -j3 install                                     | tee make_install_log.txt

# Setting the PKG_CONFIG_PATH here so matplotlib finds the libpng package
export PKG_CONFIG_PATH=${P8DEPMERMITHIDBASEDIR}/lib

#######################################################################
#
# build all python3 packages
#
########################################################################

# Get pip and setuptools
echo 'python3 packages'
cd ${P8DEPMERMITHIDBASEDIR}
wget https://bootstrap.pypa.io/get-pip.py
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} pip

# Update pip et.al.
# pkgconfig is required by lz4 and needs to be installed before...
pip3 install --prefix=${P8DEPMERMITHIDBASEDIR} setuptools pip wheel pkgconfig==1.3.1 --upgrade
which pip3

# lz4 required by root 6.13

PKG_TO_INSTALL="PyYAML==3.11 \
                pyparsing>=2.1.5 \
                dnspython==1.12.0 \
                cycler==0.10.0 \
                colorlog==3.1.2 \
                python-dateutil==2.7.2 \
                matplotlib==1.5.1 \
                pystan==2.17.0.0 \
                h5py==2.6 \
                numpy==1.14.2 \
                uproot==2.8.16 \
                lz4==1.1.0"

# Install python3 packages
# For mermithid
echo "Putting symbolic links for installing matplotlib"
ln -s ${P8DEPMERMITHIDBASEDIR}/include/png*.h /usr/include/
pip3 install --prefix=${P8DEPMERMITHIDBASEDIR} ${PKG_TO_INSTALL}

# Test the presence of ROOT and HDF5
python3 ${P8DEPMERMITHIDBASEDIR}/python_tester.py 

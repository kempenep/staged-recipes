#!/bin/bash

set -ex # Abort on error.

# uthash

curl -L --proxy http://proxy.cidsn.jrc.it:8888/ --output uthash.tar.gz https://github.com/troydhanson/uthash/archive/refs/heads/master.tar.gz

tar xzvf uthash.tar.gz
cd uthash-*
for file in src/*.h;do cp $file $PREFIX/include/$(basename $file);done
cd ..

curl -L --proxy http://proxy.cidsn.jrc.it:8888/ --output mial.tar.gz https://github.com/ec-jrc/jeolib-miallib/archive/refs/tags/v1.1.0.tar.gz

#- mial

tar xzvf mial.tar.gz
cd jeolib-miallib*
#test
cp /storage/kempepi/repositories/jeolib-miallib/CMakeLists.txt .
mkdir build
cd build
ls $PREFIX/include/zlib.h
cmake -DCMAKE_PREFIX_PATH=$PREFIX -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make
make install
cd ../..

curl -L --proxy http://proxy.cidsn.jrc.it:8888/ --output jiplib.tar.gz https://github.com/ec-jrc/jeolib-jiplib/archive/refs/tags/v1.1.1.tar.gz

# - jiplib

tar xzvf jiplib.tar.gz
cd jeolib-jiplib*
mkdir build
cd build
#cmake -DCMAKE_PREFIX_PATH=$PREFIX ..
cmake -DMIAL_INCLUDE_DIR=$PREFIX/include/miallib -DMIAL_LIBRARY=$PREFIX/lib/libmiallib.so -DCMAKE_INSTALL_PREFIX=$PREFIX -DPYTHON_INSTALL_DIR=$PREFIX ..
make
make install
cd ../..

curl -L --proxy http://proxy.cidsn.jrc.it:8888/ --output pyjeo.tar.gz https://github.com/ec-jrc/jeolib-pyjeo/archive/refs/tags/v1.1.2.tar.gz

# - pyjeo
tar xzvf pyjeo.tar.gz
cd jeolib-pyjeo*
python3 setup.py install
cd ..

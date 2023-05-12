#!/bin/bash

set -ex # Abort on error.

curl -L --output mial.tar.gz https://github.com/ec-jrc/jeolib-miallib/archive/refs/tags/v1.1.0.tar.gz

#- mial
tar xzvf mial.tar.gz
cd jeolib-miallib*
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig
cd ../..

curl -L --output jiplib.tar.gz https://github.com/ec-jrc/jeolib-jiplib/archive/refs/tags/v1.1.1.tar.gz

# - jiplib
set -xe
tar xzvf jiplib.tar.gz
cd jeolib-jiplib*
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig
cd ../..

curl -L --output pyjeo.tar.gz https://github.com/ec-jrc/jeolib-pyjeo/archive/refs/tags/v1.1.2.tar.gz

# - pyjeo
tar xzvf pyjeo.tar.gz
cd jeolib-pyjeo*
python3 setup.py install
cd ..

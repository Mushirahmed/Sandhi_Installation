#!/bin/bash

echo "Installing the required dependencies"

sudo apt-get -y install git-core autoconf automake make libtool g++ python-dev swig \
pkg-config libboost1.48-all-dev libfftw3-dev libcppunit-dev libgsl0-dev \
libusb-dev sdcc libsdl1.2-dev python-wxgtk2.8 python-numpy \
python-cheetah python-lxml doxygen python-qt4 python-qwt5-qt4 libxi-dev \
libqt4-opengl-dev libqwt5-qt4-dev libfontconfig1-dev libxrender-dev \
python-serial python-matplotlib

echo "Sciscipy installation starting"
git clone https://github.com/manojgudi/sciscipy-1.0.0.git
cd sciscipy-1.0.0/
sudo ./install

echo "Starting Sandhi installation"
cd ../
git clone http://github.com/manojgudi/sandhi.git
cd sandhi/
git submodule init
git submodule update
git pull origin master
git submodule update

mkdir build
cd build/
cmake ../
make -j 2
sudo make install
sudo ldconfig

echo "Sandhi installation complete. Go to command line and type Sandhi to start Sandhi"

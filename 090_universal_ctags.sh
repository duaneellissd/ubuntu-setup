#! /bin/bash

rm -rf ./ctags
mkdir ./ctags

cd ./ctags

git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh 
./configure
make
sudo make install

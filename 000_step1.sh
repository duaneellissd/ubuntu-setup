#! /bin/bash

sudo apt-get update
# force bash, not dash
echo "dash dash/sh boolean false" | sudo debconf-set-selections

sudo apt-get install -y git
sudo apt-get install -y emacs 
sudo apt-get install -y build-essential 
sudo apt-get install -y openssh-server
sudo apt-get install -y python-pip
sudo apt-get install -y python-setuptools 
sudo apt-get install -y python-dev 
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 


sudo apt-get install -y vim-gtk3-py2

#!/bin/bash

sudo -s

#Update software repository
apt-get update
#Download useful packages
apt-get install -y libatlas-base-dev libopencv-dev libprotoc-dev python-numpy python-scipy make unzip git gcc g++ libcurl4-openssl-dev libssl-dev
#Upgrade all remaining packages
apt-get upgrade

mkdir -p /setup-dl-lab-temp
cd /setup-dl-lab-temp
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
bash Anaconda3-5.1.0-Linux-x86_64.sh -b -p $HOME/anaconda3 -u
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc 
source ~/.bashrc


CUDA_REPO_PKG=cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
wget ${CUDA_REPO_PKG} http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_REPO_PKG} 
sudo dpkg -i ${CUDA_REPO_PKG}
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub 
rm -f ${CUDA_REPO_PKG}
sudo apt-get update
sudo apt-get install cuda-drivers -y
sudo apt-get install cuda -y
sudo reboot

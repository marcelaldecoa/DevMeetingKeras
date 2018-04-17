#!/bin/bash

# Install Anaconda
ANACONDA_BASH_FILE=Anaconda3-5.1.0-Linux-x86_64.sh
wget ${ANACONDA_BASH_FILE} https://repo.continuum.io/archive/${ANACONDA_BASH_FILE}
bash Anaconda3-5.1.0-Linux-x86_64.sh -b -p $HOME/anaconda3 -u
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc 
source ~/.bashrc
rm -f ${ANACONDA_BASH_FILE}

# Install CUDA Toolkit 9.0
cd NVIDIA/
CUDA_REPO_PKG=cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
wget ${CUDA_REPO_PKG} http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_REPO_PKG} 
sudo dpkg -i ${CUDA_REPO_PKG}
sudo apt-key add --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub 
rm -f ${CUDA_REPO_PKG}
sudo apt-get update
sudo apt-get install cuda -y
sudo reboot






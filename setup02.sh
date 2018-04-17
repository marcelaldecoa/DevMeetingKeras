#!/bin/bash

# Install Anaconda
ANACONDA_BASH_FILE=Anaconda3-5.1.0-Linux-x86_64.sh
wget ${ANACONDA_BASH_FILE} https://repo.continuum.io/archive/${ANACONDA_BASH_FILE}
bash Anaconda3-5.1.0-Linux-x86_64.sh -b -p $HOME/anaconda3 -u
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc 
source ~/.bashrc
rm -f ${ANACONDA_BASH_FILE}

# Upgrade PIP
sudo -s
pip install --upgrade pip

# Install CUDA Toolkit 9.0
cd NVIDIA/
dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
apt-get update
apt-get install cuda -y
dpkg -i cuda-repo-ubuntu1604-9-0-local-cublas-performance-update-2_1.0-1_amd64.deb
apt-get update
apt-get upgrade cuda -y

# Install cuDNN
dpkg -i libcudnn7_7.1.3.16-1+cuda9.0_amd64.deb
dpkg -i libcudnn7-dev_7.1.3.16-1+cuda9.0_amd64.deb
dpkg -i libcudnn7-doc_7.1.3.16-1+cuda9.0_amd64.deb

# Testing cuDNN
cp -r /usr/src/cudnn_samples_v7/ $HOME
cd  $HOME/cudnn_samples_v7/mnistCUDNN
make clean && make
./mnistCUDNN
cd ~

# Install TensorFlow
apt-get install libcupti-dev -y
pip install tensorflow-gpu

# FutureWarning: Conversion of the second argument of issubdtype from `float` to `np.floating` is deprecated
# Requires numpy downgrade
pip install numpy==1.13.0

# Install Keras
pip install h5py
pip install keras

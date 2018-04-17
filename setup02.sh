#!/bin/bash
GREEN='\033[1;32m'
RED='\033[0;31m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color


# Install Anaconda
printf "Installing ${GREEN}Anaconda${NC} ...\n"
ANACONDA_BASH_FILE=Anaconda3-5.1.0-Linux-x86_64.sh
wget ${ANACONDA_BASH_FILE} https://repo.continuum.io/archive/${ANACONDA_BASH_FILE}
bash Anaconda3-5.1.0-Linux-x86_64.sh -b -p $HOME/anaconda3 -u
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc 
source ~/.bashrc
rm -f ${ANACONDA_BASH_FILE}

# Upgrade PIP
printf "Upgrading ${BLUE}PIP${NC} ...\n"
pip install --upgrade pip

# Install CUDA Toolkit 9.0
printf "Installing ${GREEN}CUDA Toolkit 9.0${NC} ...\n"
cd NVIDIA/
dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
apt-get update
apt-get install cuda -y
dpkg -i cuda-repo-ubuntu1604-9-0-local-cublas-performance-update-2_1.0-1_amd64.deb
apt-get update
apt-get upgrade cuda -y

# Install cuDNN
printf "Installing ${GREEN}cuDNN${NC} ...\n"
dpkg -i libcudnn7_7.0.5.15-1+cuda9.0_amd64
dpkg -i libcudnn7-dev_7.0.5.15-1+cuda9.0_amd64
dpkg -i libcudnn7-doc_7.0.5.15-1+cuda9.0_amd64

# Testing cuDNN
printf "Testing ${BLUE}cuDNN${NC} ...\n"
cp -r /usr/src/cudnn_samples_v7/ $HOME
cd  $HOME/cudnn_samples_v7/mnistCUDNN
make clean && make
./mnistCUDNN
cd ~

# Install TensorFlow
printf "Installing ${GREEN}TensorFlow${NC} ...\n"
apt-get install libcupti-dev -y
pip install tensorflow-gpu

# FutureWarning: Conversion of the second argument of issubdtype from `float` to `np.floating` is deprecated
# Requires numpy downgrade
pip install numpy==1.13.0

# Install Keras
printf "Installing ${GREEN}Keras${NC} ...\n"
pip install h5py
pip install keras

# Testing Keras
printf "Testing ${BLUE}Keras with MNIST${NC} ...\n"
MNIST_FILE=mnist_cnn.py
wgethttps://raw.githubusercontent.com/keras-team/keras/master/examples/${MNIST_FILE}
python ${MNIST_FILE}
rm -f ${MNIST_FILE}

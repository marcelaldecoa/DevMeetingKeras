#!/bin/bash

GREEN='\033[1;32m'
RED='\033[0;31m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color


sudo -s

# Update Software Repository
printf "Updating ${GREEN}Software Repository${NC} ...\n"
apt-get update

# Download Useful Packages
printf "Downloading ${BLUE}Useful Packages${NC} ...\n"
apt-get install -y libatlas-base-dev libopencv-dev libprotoc-dev python-numpy python-scipy make unzip git gcc g++ libcurl4-openssl-dev libssl-dev
apt-get install linux-headers-$(uname -r)

# Upgrade All Remaining Packages
printf "Upgrading ${BLUE}All Remaining Packages${NC} ...\n"
apt-get upgrade -y

# Download NVIDIA files
mkdir -p NVIDIA/
cd NVIDIA/
clear
printf "Downloading ${GREEN}NVIDIA Files${NC} ...\n"
wget https://cs2253cf321f164x48c8x9e2.blob.core.windows.net/public/nvidia-diag-driver-local-repo-ubuntu1604-384.125_1.0-1_amd64.deb
wget https://cs2253cf321f164x48c8x9e2.blob.core.windows.net/public/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
wget https://cs2253cf321f164x48c8x9e2.blob.core.windows.net/public/cuda-repo-ubuntu1604-9-0-local-cublas-performance-update-2_1.0-1_amd64.deb
wget https://cs2253cf321f164x48c8x9e2.blob.core.windows.net/public/libcudnn7_7.0.5.15-1+cuda9.0_amd64.deb
wget https://cs2253cf321f164x48c8x9e2.blob.core.windows.net/public/libcudnn7-dev_7.0.5.15-1+cuda9.0_amd64.deb
wget https://cs2253cf321f164x48c8x9e2.blob.core.windows.net/public/libcudnn7-doc_7.0.5.15-1+cuda9.0_amd64.deb

# Install NVIDIA DRIVER for the GPU. Includes support for the Tesla K80 recommend in this lab.
printf "Installing ${GREEN}NVIDIA DRIVER for the GPU${NC} ...\n"
dpkg -i nvidia-diag-driver-local-repo-ubuntu1604-384.125_1.0-1_amd64.deb
apt-key add /var/nvidia-diag-driver-local-repo-384.125/7fa2af80.pub
apt-get update
apt-get install cuda-drivers -y

# Add disk to /etc/fstab to ensure properly mount during boot 
uuid=$(sudo -i blkid /dev/sdc1 | grep -oP "[\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12}")
echo UUID=$uuid     /DeepLearningLab   auto    rw,user,auto    0    0 >> /etc/fstab

# Reboot is required
printf "The VM will ${BLUE}reboot${NC} to complete the installation ...\n"
reboot

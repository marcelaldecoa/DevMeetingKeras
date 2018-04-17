#!/bin/bash

sudo -s

# Update Software Repository
apt-get update

# Download Useful Packages
apt-get install -y libatlas-base-dev libopencv-dev libprotoc-dev python-numpy python-scipy make unzip git gcc g++ libcurl4-openssl-dev libssl-dev
apt-get install linux-headers-$(uname -r)

# Upgrade All Remaining Packages
apt-get upgrade -y

# Install NVIDIA DRIVER for the GPU. Includes support for the Tesla K80 recommend in this lab.
CD NVIDIA/
dpkg -i nvidia-diag-driver-local-repo-ubuntu1604-384.125_1.0-1_amd64.deb
apt-key add /var/nvidia-diag-driver-local-repo-384.125/7fa2af80.pub
apt-get update
apt-get install cuda-drivers -y

# Reboot is required
reboot

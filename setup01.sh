#!/bin/bash

sudo -s

#Update software repository
apt-get update
#Download useful packages
apt-get install -y libatlas-base-dev libopencv-dev libprotoc-dev python-numpy python-scipy make unzip git gcc g++ libcurl4-openssl-dev libssl-dev
apt-get install linux-headers-$(uname -r)
#Upgrade all remaining packages
apt-get upgrade -y

dpkg -i nvidia-diag-driver-local-repo-ubuntu1604-384.125_1.0-1_amd64.deb
apt-get update
apt-get install cuda-drivers -y
reboot

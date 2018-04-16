#!/bin/bash
sudo -s
mkdir -p /setup-dl-lab-temp
cd /setup-dl-lab-temp
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
bash Anaconda3-5.1.0-Linux-x86_64.sh -b -p $HOME/anaconda3 -u
export PATH="$HOME/anaconda3/bin:$PATH"
source ~/.bashrc

#!/bin/bash
(
echo d # Delete existing partition table
echo n # Add a new partition
echo p # Primary partition
echo 1 # Partition number
echo   # First sector (Accept default)
echo   # Last sector (Accept default)
echo w # Write changes
) | sudo fdisk /dev/sdc

# Write the file system
sudo mkfs -t /dev/sdc1

# Create the DeepLearningLab directory
sudo mkdir /DeepLearningLab

# Mount disk to the new directory
sudo mount /dev/sdc1 /DeepLearningLab

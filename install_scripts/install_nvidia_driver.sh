#!/usr/bin/env bash
# @author:  Binbin Xu <b.xu17@imperial.ac.uk>
# @Brief: Install CUDA driver on Ubuntu
# https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html      

# Before running, find the "recommend" driver version first
# Run: sudo ubuntu-drivers devices

# Install NVIDIA driver
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update

ubuntu-drivers devices
# in case want to install the recommended version
# sudo ubuntu-drivers autoinstall

# install the selected version
sudo apt install nvidia-440

echo "NVIDIA driver installed. nvidia-smi to see it after system reboot."
# Reboot. Check that GPUs are visible using the command: nvidia-smi

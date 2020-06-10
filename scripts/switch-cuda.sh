#!/usr/bin/env bash
# @author:  Binbin Xu <b.xu17@imperial.ac.uk>
# @Brief: switch between different cuda versions 
# As long as driver is up to date, we can switch CUDA toolkit 
# CUDA toolkit - Driver compatible: https://github.com/NVIDIA/nvidia-docker/wiki/CUDA

# install cuda version beforehand: use dpkg....apt-get install.... or runfile...

#example usage: ./switch-cuda.sh 8.0

#make sure in the /.bashrc the cuda related folder exist
#such as:
# export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
# export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}} 
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64
# export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/cuda/lib64 

#Do not install 

# in case nvcc can not be used:
# sudo apt-get autoremove nvidia-cuda-toolkit 
# export PATH=$PATH:/usr/local/cuda/bin
# source ~/.bashrc
# nvcc --version


TARGET_VERSION=${1}          # the target CUDA version to switch to (if provided)

# delete the related folder
sudo rm -rf /usr/local/cuda

# build the link
cd /usr/local
sudo ln -s cuda-${TARGET_VERSION} cuda

#confirm:
nvcc --version
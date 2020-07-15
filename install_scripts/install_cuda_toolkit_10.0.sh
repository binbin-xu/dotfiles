#!/bin/bash

# this corrsponds to driver 440 + cuda 10.2
cd $(mktemp -d)

if [ "$(lsb_release -sc)" = "bionic" ]; then
  wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64
  mv cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64 cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
  sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
  sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
  sudo apt-get update
  sudo apt-get install cuda-toolkit-10-0
elif [ "$(lsb_release -sc)" = "xenial" ]; then
  wget https://developer.download.nvidia.com/compute/cuda/10.0/secure/Prod/local_installers/cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
  sudo dpkg -i cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb                                 
  sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
  sudo apt-get update
  sudo apt-get install cuda-toolkit-10-0
else
  echo "[$0] Unsupported OS: $(uname), $(lsb_release -sc)"
  exit 1
fi

cd -
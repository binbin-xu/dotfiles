#!/bin/sh

sudo apt-get remove cmake-data

wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null

if [ "$(lsb_release -sc)" = "bionic" ]; then
    sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
    sudo apt-get update
elif [ "$(lsb_release -sc)" = "xenial" ]; then
    sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
    sudo apt-get update
else
  echo "[18.04] Unsupported OS: $(uname), $(lsb_release -sc)"
  exit 1
fi


sudo apt-get install kitware-archive-keyring
sudo rm /etc/apt/trusted.gpg.d/kitware.gpg

sudo apt-get install cmake

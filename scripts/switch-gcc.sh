#!/bin/sh

# current version
ll /usr/bin/gcc*

# install gcc 4.8 and 5
sudo apt install gcc-4.8 gcc-4.8-multilib g++-4.8 g++-4.8-multilib
sudo apt install gcc-5 gcc-5--multilib g++-5 g++-5--multilib

# set update-alternatives
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 40 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50 --slave /usr/bin/g++ g++ /usr/bin/g++-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7

# choose which gcc to use
sudo update-alternatives --config gcc

# confirm
gcc -v

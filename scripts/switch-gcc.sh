#!/bin/sh

# check existing gcc versions
ll /usr/bin/gcc*

# install gcc 4.8 and 5
sudo apt install gcc-4.9 gcc-4.9-multilib g++-4.9 g++-4.9-multilib
sudo apt install gcc-5 gcc-5--multilib g++-5 g++-5--multilib

# set update-alternatives
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 40 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50 --slave /usr/bin/g++ g++ /usr/bin/g++-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7

# choose which gcc to use
sudo update-alternatives --config gcc

# confirm
gcc -v

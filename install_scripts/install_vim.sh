#!/bin/bash

if [ "$(uname)" == "Linux" ]; then
        sudo add-apt-repository ppa:jonathonf/vim
        sudo apt update
        sudo apt install vim
fi

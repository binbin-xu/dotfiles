#!/usr/bin/env bash

if [[ "$(uname)" == "Linux" ]]; 
then
    sudo apt update
    sudo apt install snapd
fi
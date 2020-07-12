#!/usr/bin/env zsh

setup(){
    export PYTHONPATH=$HERE:$PYTHONPATH

    source $HERE/.anaconda3/bin/activate
    path_prepend $HERE/.anaconda3/bin
}
HERE=${0:a:h}
setup
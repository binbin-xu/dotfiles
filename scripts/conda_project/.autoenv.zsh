#!/usr/bin/env zsh

setup(){
    source $HERE/.anaconda3/bin/activate
}
HERE=${0:a:h}
setup
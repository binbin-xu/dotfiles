#!/usr/bin/env zsh

pythonpath_remove() {
    PYTHONPATH=$(echo -n "$PYTHONPATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

pythonpath_prepend() {
    pythonpath_remove "$1"
    PYTHONPATH="$1${PYTHONPATH:+":$PYTHONPATH"}"
}

setup(){
    pythonpath_prepend $HERE

    source $HERE/.anaconda3/bin/activate
    path_prepend $HERE/.anaconda3/bin
    
    # environment
    # source $HERE/.anaconda3/bin/activate ENVX
    # path_prepend $HERE/.anaconda3/envs/ENVX/bin
}
HERE=${0:a:h}
setup
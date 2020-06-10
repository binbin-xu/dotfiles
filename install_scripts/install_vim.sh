#!/bin/bash
echo_error () {
    echo -e "\033[31mError: $*\033[0m"
    exit 1
}

case "$(uname -s)" in
    # 'Mac OS X'
    Darwin)
        brew upgrade vim
        ;;

    Linux)
        sudo add-apt-repository ppa:jonathonf/vim
        sudo apt update
        sudo apt install vim-gnome
        ;;

    CYGWIN*|MINGW32*|MSYS*)
        echo_error "unsupported platform"
        ;;

    *)
        echo_error "unsupported platform"
        ;;
esac

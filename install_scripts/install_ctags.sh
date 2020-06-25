#!/usr/bin/env bash

case "$(uname -s)" in
    # 'Mac OS X'
    Darwine)
        brew install --HEAD universal-ctags/universal-ctags/universal-ctags
        ;;

    Linux)
        sudo snap install universal-ctags
        ;;

    CYGWIN*|MINGW32*|MSYS*)
        echo "unsupported platform"
        ;;

    *)
        echo "unsupported"
        ;;
esac
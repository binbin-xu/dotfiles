#!/bin/sh

case "$(uname -s)" in
    # 'Mac OS X'
    Darwin)
        brew install shellcheck 
        ;;

    Linux)
        sudo apt-get install shellcheck
        ;;

    CYGWIN*|MINGW32*|MSYS*)
        echo "unsupported platform"
        ;;

    *)
        echo "unsupported"
        ;;
esac

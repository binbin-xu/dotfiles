#!/bin/sh

if [ -f ~/.local/bin/tmux ]; then
  exit 0
fi

echo_error () {
    echo -e "\033[31mError: $*\033[0m"
    exit 1
}

TMPDIR=$(mktemp -d)
cd $TMPDIR

case "$(uname -s)" in
    # 'Mac OS X'
    Darwin)
        brew install tmux      
        ;;

    Linux)
        VERSION=3.0a
        wget -q https://github.com/tmux/tmux/releases/download/3.0a/tmux-${VERSION}-x86_64.AppImage
        chmod +x tmux-${VERSION}-x86_64.AppImage
        mv ./tmux-${VERSION}-x86_64.AppImage ~/.local/bin/tmux
        ;;

    CYGWIN*|MINGW32*|MSYS*)
        echo_error "unsupported platform"
        ;;

    *)
        echo_error "unsupported platform"
        ;;
esac

rm -rf $TMPDIR
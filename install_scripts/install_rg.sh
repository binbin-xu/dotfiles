#!/bin/bash

if [ "$(uname)" = "Linux" ]; then
    TMPDIR=$(mktemp -d)

    cd $TMPDIR
    set -x

    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb

    sudo dpkg -i ripgrep_11.0.2_amd64.deb

    rm ripgrep_11.0.2_amd64.deb
    rm -rf $TMPDIR
    set +x

elif [ "$(uname)" = "Darwin" ]; then
    brew install ripgrep
else
    echo "[$(basename $0)] Unsupported platform: $(uname)"
    exit 0
fi


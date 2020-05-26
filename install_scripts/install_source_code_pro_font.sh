#!/bin/bash

if [ "`uname`" != "Linux" ]; then
  exit 0
fi

fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p "${fonts_dir}"
else
    echo "Found fonts dir $fonts_dir"
fi

if [ -f $fonts_dir/SourceCodePro-Black.otf ]; then
  exit 0
fi

set -x

TMPDIR=$(mktemp -d)
cd $TMPDIR

wget -q https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
unzip -qq 1.050R-it.zip
cp source-code-pro-2.030R-ro-1.050R-it/OTF/*.otf $fonts_dir/
fc-cache -f -v

rm -rf $TMPDIR

set +x
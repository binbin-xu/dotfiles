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

# if [ -f $fonts_dir/SourceCodePro-Black.otf ]; then
#   exit 0
# fi

set -x

TMPDIR=$(mktemp -d)
cd $TMPDIR

wget -q https://github.com/microsoft/cascadia-code/releases/download/v2005.15/CascadiaCode_2005.15.zip
unzip -qq CascadiaCode_2005.15.zip
cp ttf/*.ttf $fonts_dir

fc-cache -f -v

rm -rf $TMPDIR

set +x
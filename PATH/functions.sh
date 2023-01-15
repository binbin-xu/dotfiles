path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

here() {
    local loc
    if [ "$#" -eq 1 ]; then
        loc=$(realpath "$1")
    else
        loc=$(realpath ".")
    fi
    ln -sfn "${loc}" "$HOME/.shell.here"
    echo "here -> $(readlink $HOME/.shell.here)"
}

there="$HOME/.shell.here"

there() {
    cd "$(readlink "${there}")"
}

pythonpath_remove() {
    PYTHONPATH=$(echo -n "$PYTHONPATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

pythonpath_prepend() {
    pythonpath_remove "$1"
    PYTHONPATH="$1${PYTHONPATH:+":$PYTHONPATH"}"
}

###### for MAC GNU commands
gnu_utils=(
  coreutils
  # the other utils ...
)

gnu() {
  for _util in "${gnu_utils[@]}"; do
    # Intel
    # export PATH="/usr/local/opt/$_util/libexec/gnubin:$PATH"
    # M1
    export PATH="$(brew --prefix)/opt/$_util/libexec/gnubin:$PATH"
  done
  [[ $1 == "--quiet" ]] || echo "Switched to GNU utils!"
}

bsd() {
  for _util in "${gnu_utils[@]}"; do
    export PATH="$(echo $PATH | sed "s|/usr/local/opt/$_util/libexec/gnubin:||")"
  done
  echo "Switched to BSD utils!"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  gnu --quiet
fi
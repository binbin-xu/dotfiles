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

###### for MAC Homebrew & GNU commands
if [[ "$OSTYPE" == "darwin"* ]] && [[ -d /opt/homebrew ]]; then
  path_prepend /opt/homebrew/sbin
  path_prepend /opt/homebrew/bin
  export MANPATH="/opt/homebrew/share/man${MANPATH:+:$MANPATH}"
fi

gnu_utils=(
  coreutils
  # the other utils ...
)

gnu() {
  if ! command -v brew >/dev/null 2>&1; then
    return 0
  fi
  local brew_prefix
  brew_prefix="$(brew --prefix)"
  for _util in "${gnu_utils[@]}"; do
    if [[ -d "$brew_prefix/opt/$_util/libexec/gnubin" ]]; then
      path_prepend "$brew_prefix/opt/$_util/libexec/gnubin"
    fi
  done
  [[ $1 == "--quiet" ]] || echo "Switched to GNU utils!"
}

bsd() {
  local brew_prefix="/usr/local"
  if command -v brew >/dev/null 2>&1; then
    brew_prefix="$(brew --prefix)"
  fi
  for _util in "${gnu_utils[@]}"; do
    path_remove "$brew_prefix/opt/$_util/libexec/gnubin"
    path_remove "/usr/local/opt/$_util/libexec/gnubin"
  done
  echo "Switched to BSD utils!"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  gnu --quiet
fi
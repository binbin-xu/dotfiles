HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
shopt -s histappend # append to history file, don't overwrite it

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export EDITOR=vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

ATTRIBUTE_BOLD='\[\e[1m\]'
ATTRIBUTE_RESET='\[\e[0m\]'
COLOR_DEFAULT='\[\e[39m\]'
COLOR_RED='\[\e[31m\]'
COLOR_GREEN='\[\e[32m\]'
COLOR_YELLOW='\[\e[33m\]'
COLOR_BLUE='\[\e[34m\]'
COLOR_MAGENTA='\[\e[35m\]'
COLOR_CYAN='\[\e[36m\]'

machine_name() {
    if [[ -f $HOME/.name ]]; then
        cat $HOME/.name
    else
        hostname
    fi
}

# colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

PROMPT_DIRTRIM=5
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

parse_branch() {
  local branch
  branch=`git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  [ "$branch" != "" ] && printf "\e[0m on \e[0;33m$branch\e[0m"
}
show_venv() {
  if [ ! -z $CONDA_PREFIX ]; then
    printf " workon \e[0;34mconda:$CONDA_DEFAULT_ENV\e[0m"
  fi
}
# uncomment for a colored prompt, if the terminal has the capability; turned off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#     # We have color support; assume it's compliant with Ecma-48
#     # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#     # a case would tend to support setf rather than setaf.)
#     color_prompt=yes
#     else
#     color_prompt=
#     fi
# fi

if [ "$color_prompt" = yes ]; then
    PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_branch)\e[0m$(show_venv)\n$ '
    PS2="${COLOR_BLUE}>${COLOR_DEFAULT} "
else
    PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$$(parse_branch)\e[0m$(show_venv)\n$ '
    PS2="${COLOR_BLUE}>${COLOR_DEFAULT} "
fi
unset color_prompt force_color_prompt
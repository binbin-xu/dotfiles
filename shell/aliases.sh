# For a full list of active aliases, run `alias`.

function alias_if_exists() {
  # Does the alias only if the aliased program is installed
    if command -v $2 > /dev/null; then
        alias "$1"="$2"
    fi
}


# Better defaults
# alias ncdu='ncdu --confirm-quit --color dark'
alias crontab="VIM_CRONTAB=true crontab"
alias_if_exists 'diff' 'colordiff'
alias_if_exists 'ag' 'rg'
alias_if_exists 'vim' 'nvim'
alias_if_exists 'fdupes' 'jdupes'

# MacOS GNUs
for i in awk cat chgrp chmod chown chroot cut date df du echo egrep env false fgrep find grep join kill link ln logname ls make mkdir mknod mktemp mv nice nohup paste perf printf pwd readlink realpath rm rmdir sed sort split tac tail tar tee test touch tr true truncate tty uniq unlink unzip uptime users who whoami yes zip; do
   alias_if_exists "$i" "g$i"
done
alias_if_exists "id" "/usr/local/bin/gid"

###########################################################
# Shortcuts

# Use colors in coreutils utilities output
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -lh'

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'

# overwritten aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir="mkdir -p"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format
alias rsync='rsync -av -P'

# git related aliases
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gst='git status'
# commit 
alias gc='git commit -v'
alias gcam='git commit -a -m'
alias gcmsg='git commit -m'
# Note that gs is also ghostscript
alias ghostscript="/usr/local/bin/gs"
alias gl='git pull'
alias gp='git push'
alias gg='git graph'
# unalias gd
alias gd='git diff'
alias gD='git ls-files'
alias gag='git exec ag'

# tensorboard 
alias tb='tensorboard --logdir '

# tmux
alias ta='tmux attach -t'
alias tn='tmux new -s '
alias tl='tmux list-sessions'

## Jupyter
alias jc="jupyter console"
alias jco="jupyter nbconvert"
alias jn="jupyter notebook"
alias jn-b="jupyter notebook --no-browser"

# python
alias py3='python3 '

#conda 
alias ca='conda activate'
alias sa='source activate'
alias cda='conda deactivate'
alias sd="source deactivate"

# Mirror stdout to stderr, useful for seeing data going through a pipe
alias peek='tee >(cat 1>&2)'

# ssh:
# do not use aliases, use config instead
# alias sshbigdaddy="ssh bx516@bigdaddy.doc.ic.ac.uk"
# alias sshcressida="ssh bx516@cressida.doc.ic.ac.uk"
# alias sshbasalt="ssh bx516@basalt.doc.ic.ac.uk"

######################################################
# Functions

# google command
google () {
  search=""
  for term in $@; do
      search="$search%20$term"
  done
  open "http://www.google.com/search?q=$search"
}

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Use pip without requiring virtualenv
syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

syspip2() {
    PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

syspip3() {
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Jump to directory containing file
jump() {
    cd "$(dirname ${1})"
}

# cd replacement for screen to track cwd (like tmux)
scr_cd()
{
    builtin cd $1
    screen -X chdir "$PWD"
}

if [[ -n $STY ]]; then
    alias cd=scr_cd
fi

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && ${@}
    )
}

# Check if a file contains non-ascii characters
nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' "${1}"
}

# Fetch pull request

fpr() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "error: fpr must be executed from within a git repository"
        return 1
    fi
    (
        cdgr
        if [ "$#" -eq 1 ]; then
            local repo="${PWD##*/}"
            local user="${1%%:*}"
            local branch="${1#*:}"
        elif [ "$#" -eq 2 ]; then
            local repo="${PWD##*/}"
            local user="${1}"
            local branch="${2}"
        elif [ "$#" -eq 3 ]; then
            local repo="${1}"
            local user="${2}"
            local branch="${3}"
        else
            echo "Usage: fpr [repo] username branch"
            return 1
        fi

        git fetch "git@github.com:${user}/${repo}" "${branch}:${user}/${branch}"
    )
}

# fzf
if command -v fzf > /dev/null; then

  function fzf-history() {
      local tac
      if which tac > /dev/null; then
          tac="tac"
      else
          tac="tail -r"
      fi
      BUFFER=$(\history -n 1 | fzf)
      CURSOR=$#BUFFER
  }
  # zle -N fzf-history
  # bindkey '^r' fzf-history

  fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
  }

  # fkill - kill process
  fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
      echo $pid | xargs kill -${1:-9}
    fi
  }

  v() {
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vim "${file}" || return 1
  }

  if command -v subl > /dev/null; then
    u() {
      local file
      file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && subl "${file}" || return 1
    }
  fi

  #less on fuzzy find
  fl() {
    less $(fzf)
  }

fi

# Complete from google
function auto() {
    url='https://www.google.com/complete/search?client=hp&hl=en&xhr=t'
    # NB: user-agent must be specified to get back UTF-8 data!
    curl -H 'user-agent: Mozilla/5.0' -sSG --data-urlencode "q=$*" "$url" |
        jq -r ".[1][][0]" |
        sed 's,</\?b>,,g'
}

init-autoenv () {
  vim .autoenv.zsh
  vim .autoenv_leave.zsh
}


####################################################################
# OS dependent aliases
case "$(uname -s)" in
    # 'Mac OS X'
    Darwin)
        alias clear-dnscache="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
        alias bu="brew update && brew outdated | xargs brew upgrade  && brew cleanup -s"
        alias mvf='mv "$(pfs)"' # Move current finder selection
        alias ssh_unmount='sudo diskutil unmount force '
        alias ls='ls -G'
        ;;

    Linux)
        #  echo 'Linux'
        alias watch_gpu='watch -n 0.1 nvidia-smi'
        alias ssh_unmount='fusermount -u '
        alias ls='ls --color=auto'

            ;;

    CYGWIN*|MINGW32*|MSYS*)
        # echo 'MS Windows'
        ;;

        # Add here more strings to compare
        # See correspondence table at the bottom of this answer

    *)
        # echo 'other OS'
        ;;
esac


# Shell dependent Alias (only zsh has global aliases)
case $SHELL in
*/zsh)
   # assume Zsh
   ;;
*/bash)
   # assume Bash
   ;;
*)
   # assume something else
   ;;
esac

# hostname dependent alias
if [[ "$(hostname)" == "binbin-pc" ]]; then 
    alias earphone='python3 /home/binbin/Documents/bluetooth\ sound/sony_connect.py' 
fi

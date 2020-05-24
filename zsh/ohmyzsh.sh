ZSH_THEME="agnoster"
plugins=(
    # zsh-autosuggestions
    git
    zsh-syntax-highlighting
    zsh-completions
)
# export PATH=$PATH:$HOME/.dotfiles/scripts
export ZSH=$HOME/.oh-my-zsh
# export EDITOR="st -e nvim"
source $ZSH/oh-my-zsh.sh
export LANG="en_US.UTF-8"

# completion
autoload -Uz compinit && compinit   # zsh-completions
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH

# # conda copy from bashrc
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
#  __conda_setup="$('/home/binbin/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/binbin/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/binbin/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/binbin/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH

# # Path to your oh-my-zsh installation.
# export ZSH="~/.oh-my-zsh"
# export PATH="$HOME/.npm-packages/bin:$PATH"

# # Set name of the theme to load --- if set to "random", it will
# # load a random theme each time oh-my-zsh is loaded, in which case,
# # to know which specific one was loaded, run: echo $RANDOM_THEME
# # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# # ZSH_THEME="agnoster"


# # Which plugins would you like to load?
# # Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# # Example format: plugins=(rails git textmate ruby lighthouse)
# # Add wisely, as too many plugins slow down shell startup.
# # plugins=(git history zsh-autosuggestions zsh-syntax-highlighting zsh-nvm)

# # source $ZSH/oh-my-zsh.sh
# source ~/.oh-my-zsh/oh-my-zsh.sh

# # User configuration

# # export MANPATH="/usr/local/man:$MANPATH"

# # You may need to manually set your language environment
# # export LANG=en_US.UTF-8

# # Preferred editor for local and remote sessions
# # if [[ -n $SSH_CONNECTION ]]; then
# #   export EDITOR='vim'
# # else
# #   export EDITOR='mvim'
# # fi

# # Compilation flags
# # export ARCHFLAGS="-arch x86_64"

# # ssh
# # export SSH_KEY_PATH="~/.ssh/rsa_id"

# # Set personal aliases, overriding those provided by oh-my-zsh libs,
# # plugins, and themes. Aliases acan be placed here, though oh-my-zsh
# # users are encouraged to define aliases within the ZSH_CUSTOM folder.
# # For a full list of active aliases, run `alias`.
# #
# # Example aliases
# # alias zshconfig="mate ~/.zshrc"
# # alias ohmyzsh="mate ~/.oh-my-zsh"

# # Overwrite existing commands for better defaults
# alias mv="mv -i"           # -i prompts before overwrite
# alias mkdir="mkdir -p"     # -p make parent dirs as needed
# alias df="df -h"           # -h prints human readable format

# # git 
# alias ga='git add'
# alias gaa='git add --all'
# alias gb='git branch'
# alias gc='git commit -v'
# alias gcam='git commit -a -m'
# alias gcmsg='git commit -m'
# alias gd='git diff'
# alias gl='git pull'
# alias gp='git push'
# alias gst='git status'

# alias tb='tensorboard --logdir '

# # tmux
# alias ta='tmux attach -t'
# alias tn='tmux new -s '
# alias tl='tmux list-sessions'
# alias tksv='tmux kill-server'
# alias tkss='tmux kill-session -t'

# alias py3='python3 '
# alias grep="grep --color=auto"

# #conda 
# alias ca='conda activate'
# alias sa='source activate'
# alias cda='conda deactivate'
# alias sd="source deactivate"

# alias earphone='python3 /home/binbin/Documents/bluetooth\ sound/sony_connect.py'

# #ssh
# alias sshbigdaddy="ssh bx516@bigdaddy.doc.ic.ac.uk"
# alias sshcressida="ssh bx516@cressida.doc.ic.ac.uk"
# alias sshbasalt="ssh bx516@basalt.doc.ic.ac.uk"
# alias sshlabdesktop="ssh binbin@129.31.142.208"
# alias ssh_unmount='sudo diskutil unmount force '
# alias sshwork='sshfs binbin@129.31.142.208:/home/binbin/code/Tool/tensorflow/dense_feature_tracking /Users/Xu/Code/ssh_project'
# # source ~/.bash_profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # ssh
# alias sshbasalt='ssh bx516@basalt.doc.ic.ac.uk'
# alias sshcressida='ssh bx516@cressida.doc.ic.ac.uk'
# alias sshbigDaddy='ssh bx516@bigdaddy.doc.ic.ac.uk'
# alias ssh_unmount='fusermount -u '
# alias watch_gpu='watch -n 0.1 nvidia-smi'
# alias download_from_bigdaddy='rsync -av -P bx516@bigdaddy.doc.ic.ac.uk:'
# #system
# alias dfh='df -h'
# alias ls='ls --color=auto -hl'
# init-autoenv () {
#   vim .autoenv.zsh
#   vim .autoenv_leave.zsh
# }

# alias init_autoenv=init-autoenv
# # added by Pew
# source $(pew shell_config)
# # source ~/.dotfiles/lib/zsh-autoenv/autoenv.zsh
# #source /opt/ros/kinetic/setup.zsh


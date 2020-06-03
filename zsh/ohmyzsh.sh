ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    zsh-autosuggestions
    # git    # comment out due to too many alias info
    zsh-syntax-highlighting
    zsh-completions
)
# export PATH=$PATH:$HOME/.dotfiles/scripts
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Use vim as the editor
export EDITOR=vim
export LANG="en_GB.UTF-8"  # for server usage
if [[ "$(uname)" == "Darwin" ]]; then
    export LSCOLORS="exgxfxdacxDaDaxbadacex"
fi

# completion
autoload -Uz compinit && compinit   # zsh-completions
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

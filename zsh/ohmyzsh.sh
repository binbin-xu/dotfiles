ZSH_THEME="agnoster"
plugins=(
    # zsh-autosuggestions
    git
    zsh-syntax-highlighting
    zsh-completions
)
# export PATH=$PATH:$HOME/.dotfiles/scripts
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Use vim as the editor
export EDITOR=vim
export LANG="en_US.UTF-8"

# completion
autoload -Uz compinit && compinit   # zsh-completions
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
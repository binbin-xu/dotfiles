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
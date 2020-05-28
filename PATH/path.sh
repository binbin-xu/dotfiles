#user bin
export PATH="$PATH:$HOME/bin"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -e ~/.npm-packages ]; then
  export PATH="$HOME/.npm-packages/bin:$PATH"
fi

#brew sbin
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"




# ------------------
# cuda configuration
# ------------------

export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/lib:/usr/lib:$LIBRARY_PATH
export CPATH=/usr/include:$CPATH
export CFLAGS=-I/usr/include
export LDFLAGS="-L/usr/local/lib -L/usr/lib"
if [ -e /usr/local/cuda ]; then
  export CUDA_PATH=/usr/local/cuda
  export PATH=$CUDA_PATH/bin:$PATH
  export CPATH=$CUDA_PATH/include:$CPATH
  export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$CUDA_PATH/lib:$LD_LIBRARY_PATH
  export CFLAGS=-I$CUDA_PATH/include
  export LDFLAGS="-L$CUDA_PATH/lib64 -L$CUDA_PATH/lib"
  # cudnn
  if [ "$CUDNN_PATH" = "" ]; then
    export CUDNN_PATH=~/.cudnn/active/cuda
  fi
  export LD_LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
  export CPATH=~/.cudnn/active/cuda/include:$CPATH
  export LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LIBRARY_PATH
fi


# -------------------------------------------
# path for git 
# -------------------------------------------
export PATH="$PATH:$HOME/.diff-so-fancy"

#############################################
#### machine-specific configuration
#############################################

case "$(hostname)" in
binbin-pc)
   # lab desktop
   # conda copy from bashrc
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/home/binbin/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/binbin/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/binbin/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/binbin/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<

   ;;

*)
   # assume something else
   ;;
esac
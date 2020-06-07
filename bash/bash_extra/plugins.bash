# dircolors
if [[ "$(tput colors)" == "256" ]]; then
    if [[ "$(uname)" == "Linux" ]]; then 
        eval "$(dircolors ~/.shell/plugins/dircolors-solarized/dircolors.256dark)"
    fi

    if [[ "$(uname)" == "Darwin" ]]; then 
        export CLICOLOR=YES
        export LSCOLORS="Gxfxcxdxbxegedabagacad"
    fi
fi

# direnv
eval "$(direnv hook bash)"


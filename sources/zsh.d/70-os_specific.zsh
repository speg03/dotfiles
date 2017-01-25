if [ "$(uname)" = "Linux" ]; then
    source $HOME/.zsh.d/os_specific/for_linux.zsh
elif [ "$(uname)" = "Darwin" ]; then
    source $HOME/.zsh.d/os_specific/for_mac.zsh
fi

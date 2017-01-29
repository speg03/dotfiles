bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

### fzf
if [ -f $HOME/.fzf/shell/key-bindings.zsh ]; then
    source $HOME/.fzf/shell/key-bindings.zsh
fi

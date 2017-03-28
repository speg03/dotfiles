bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

## fzf
if [[ -e $HOME/.fzf/shell/key-bindings.zsh ]]; then
    debug "$HOME/.fzf/shell/key-bindings.zsh"
    source $HOME/.fzf/shell/key-bindings.zsh
fi

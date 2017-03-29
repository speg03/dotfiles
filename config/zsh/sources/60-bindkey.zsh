bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

## fzf
if [[ -e $(ghq root)/github.com/junegunn/fzf/shell/key-bindings.zsh ]]; then
    debug "$(ghq root)/github.com/junegunn/fzf/shell/key-bindings.zsh"
    source $(ghq root)/github.com/junegunn/fzf/shell/key-bindings.zsh
fi

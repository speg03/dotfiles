bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

source_if_exists "$SRC_HOME/github.com/junegunn/fzf/shell/key-bindings.zsh"

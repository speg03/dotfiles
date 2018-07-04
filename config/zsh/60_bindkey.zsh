bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

bindkey '^]' _change-repository
bindkey '^@' _change-worktree

source-if-exists "$SRC_HOME/github.com/junegunn/fzf/shell/key-bindings.zsh"

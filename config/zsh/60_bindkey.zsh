bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

bindkey '^]' _change-repository
bindkey '^@' _activate-python-venv

source-if-exists "/usr/share/fzf/shell/key-bindings.zsh"
source-if-exists "/usr/local/opt/fzf/shell/key-bindings.zsh"

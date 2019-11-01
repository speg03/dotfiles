autoload -Uz compinit

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

typeset -xU fpath
fpath=(/usr/local/share/zsh-completions(N-/) $fpath)
fpath=($HOME/.local/share/zsh/completions(N-/) $fpath)

compinit -i -u -d "$HOME/.cache/zsh/zcompdump"

source-if-exists "/usr/share/zsh/site-functions/fzf"
source-if-exists "/usr/local/opt/fzf/shell/completion.zsh"
source-if-exists "$HOME/.local/lib/google-cloud-sdk/completion.zsh.inc"

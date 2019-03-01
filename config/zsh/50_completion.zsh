autoload -Uz compinit

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

typeset -xU fpath
fpath=(/usr/local/share/zsh-completions(N-/) $fpath)
fpath=($DATA_HOME/zsh/completions(N-/) $fpath)

compinit -i -u -d "$CACHE_HOME/zsh/zcompdump"

source-if-exists "/usr/share/zsh/site-functions/fzf"
source-if-exists "/usr/local/opt/fzf/shell/completion.zsh"
source-if-exists "$LIB_HOME/google-cloud-sdk/completion.zsh.inc"

autoload -Uz compinit

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

typeset -xU fpath
fpath=(/usr/local/share/zsh-completions(N-/) $fpath)
fpath=($DATA_HOME/zsh/completions(N-/) $fpath)

compinit -iu


source_if_exists "/usr/local/share/zsh/site-functions/_aws"
source_if_exists "$SRC_HOME/github.com/junegunn/fzf/shell/completion.zsh"
source_if_exists "$GOPATH/src/github.com/mattn/memo/misc/completion.zsh"

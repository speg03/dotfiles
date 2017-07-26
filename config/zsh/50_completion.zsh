autoload -Uz compinit

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## zsh
fpath=(/usr/local/share/zsh-completions(N-/) $fpath)
fpath=($HOME/.local/share/zsh/completions(N-/) $fpath)

compinit -iu


## AWS
if [[ -e /usr/local/share/zsh/site-functions/_aws ]]; then
    debug "/usr/local/share/zsh/site-functions/_aws"
    source /usr/local/share/zsh/site-functions/_aws
fi

## fzf
if [[ -e $(ghq root)/github.com/junegunn/fzf/shell/completion.zsh ]]; then
    debug "$(ghq root)/github.com/junegunn/fzf/shell/completion.zsh"
    source $(ghq root)/github.com/junegunn/fzf/shell/completion.zsh
fi

## memo
if [[ -e $GOPATH/src/github.com/mattn/memo/misc/completion.zsh ]]; then
    debug "$GOPATH/src/github.com/mattn/memo/misc/completion.zsh"
    source $GOPATH/src/github.com/mattn/memo/misc/completion.zsh
fi

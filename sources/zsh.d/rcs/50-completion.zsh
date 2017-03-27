zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## zsh
fpath=(/usr/local/share/zsh-completions(N-/) $fpath)
fpath=($HOME/.zsh.d/completion(N-/) $fpath)

## AWS
if [[ -e /usr/local/share/zsh/site-functions/_aws ]]; then
    debug "/usr/local/share/zsh/site-functions/_aws"
    source /usr/local/share/zsh/site-functions/_aws
fi

## fzf
if [[ -e $HOME/.fzf/shell/completion.zsh ]]; then
    debug "$HOME/.fzf/shell/completion.zsh"
    source $HOME/.fzf/shell/completion.zsh
fi

compinit -iu

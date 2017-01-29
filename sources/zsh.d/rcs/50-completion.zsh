## AWS
if exists /usr/local/share/zsh/site-functions/_aws; then
    debug "/usr/local/share/zsh/site-functions/_aws"
    source /usr/local/share/zsh/site-functions/_aws
fi

## fzf
if exists $HOME/.fzf/shell/completion.zsh; then
    debug "$HOME/.fzf/shell/completion.zsh"
    source $HOME/.fzf/shell/completion.zsh
fi

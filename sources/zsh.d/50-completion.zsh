### AWS
if [ -f /usr/local/share/zsh/site-functions/_aws ]; then
    source /usr/local/share/zsh/site-functions/_aws
fi

### fzf
if [ -f $HOME/.fzf/shell/completion.zsh ]; then
    source $HOME/.fzf/shell/completion.zsh
fi

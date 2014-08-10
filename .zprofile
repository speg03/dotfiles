export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin
export EDITOR='emacsclient -e nil >/dev/null 2>&1 || emacs --daemon; emacsclient -t'

## rbenv
export PATH=$HOME/.rbenv/bin:$PATH
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
    export PATH=$HOME/.rbenv/shims:$PATH
fi

## go
if [ ! -d $HOME/.go ]; then
    mkdir $HOME/.go
fi
export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH

## server specific profile
if [ -e $HOME/.zprofile.local ]; then
    source $HOME/.zprofile.local
fi

## user specific PATHs
export PATH=$HOME/local/bin:$HOME/bin:$PATH

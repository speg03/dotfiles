export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin
export EDITOR='emacsclient -e nil >/dev/null 2>&1 || emacs --daemon; emacsclient -t'

## rbenvに関する設定
export PATH=$HOME/.rbenv/bin:$PATH
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
    export PATH=$HOME/.rbenv/shims:$PATH
fi

## Goに関する設定
if [ ! -d ~/.go ]; then
    mkdir ~/.go
fi
export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH

## 個人用設定ファイルが存在すれば読み込む
if [ -e ~/.zprofile.local ]; then
    source ~/.zprofile.local
fi

## ユーザの実行ファイルパスを追加
export PATH=$HOME/local/bin:$HOME/bin:$PATH

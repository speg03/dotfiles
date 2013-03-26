export PATH=$HOME/local/bin:$HOME/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin
export EDITOR='emacsclient -t'

if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
    export PATH=$HOME/.rbenv/shims:$PATH
fi

## 個人用設定ファイルが存在すれば読み込む
if [ -e ~/.zprofile_private ]; then
    source ~/.zprofile_private
fi

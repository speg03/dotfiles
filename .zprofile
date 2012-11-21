export PATH=$HOME/local/bin:$HOME/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin

## 個人用設定ファイルが存在すれば読み込む
if [ -e ~/.zprofile_private ]; then
    source ~/.zprofile_private
fi

# -*- coding: utf-8; mode: shell-script; -*-

## 各種設定ファイルを読み込む
for rc in $HOME/.zsh.d/*.zsh; do
    source $rc
done

## 個人用設定ファイルが存在すれば読み込む
if [ -e ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

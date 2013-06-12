# -*- coding: utf-8; mode: shell-script; -*-

## 各種設定ファイルを読み込む
for rc in $HOME/.zsh.d/*; do
    source $rc
done

## 個人用設定ファイルが存在すれば読み込む
if [ -e ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

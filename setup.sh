#!/usr/bin/env bash

set -eu
current_dir=$(cd "$(dirname "$0")"; pwd)


symlink() {
    local src_path=$1
    local dst_path=$2

    if [[ ! -L $dst_path && -e $dst_path ]]; then
        # 宛先がシンボリックリンク以外で存在する場合
        echo "$dst_path already exists."
    else
        mkdir -p "$(dirname "$dst_path")"
        ln -snf "$src_path" "$dst_path"
    fi
}


for src in "$current_dir"/config/*; do
    symlink "$src" "$HOME/.config/$(basename "$src")"
done

for src in "$current_dir"/bin/*; do
    symlink "$src" "$HOME/.local/bin/$(basename "$src")"
done

symlink .config/emacs/init.el "$HOME/.emacs"
symlink .config/rsync/rsync-filter "$HOME/.rsync-filter"
symlink .config/tmux/tmux.conf "$HOME/.tmux.conf"
symlink .config/zsh/zshenv "$HOME/.zshenv"
symlink .config/zsh/zshrc "$HOME/.zshrc"

#!/usr/bin/env bash

set -eu

DOTFILES_ROOT="$HOME/.local/src/github.com/speg03/dotfiles"
if [[ ! -e $DOTFILES_ROOT ]]; then
    git clone https://github.com/speg03/dotfiles "$DOTFILES_ROOT"
fi
cd "$DOTFILES_ROOT"

# ------------------------------
# Symbolic links
# ------------------------------

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


for src in "$DOTFILES_ROOT"/config/*; do
    symlink "$src" "$HOME/.config/$(basename "$src")"
done

for src in "$DOTFILES_ROOT"/bin/*; do
    symlink "$src" "$HOME/.local/bin/$(basename "$src")"
done

symlink .config/gnupg "$HOME/.gnupg"
symlink .config/zsh/zshenv "$HOME/.zshenv"
symlink .config/zsh/zshrc "$HOME/.zshrc"

if [[ $(uname -s) == Darwin ]]; then
    symlink gpg-agent_darwin.conf "$HOME/.config/gnupg/gpg-agent.conf"
    symlink "$HOME/.config/Code/User" "$HOME/Library/Application Support/Code/User"
    symlink "$HOME/.config/pypoetry" "$HOME/Library/Application Support/pypoetry"
elif [[ $(uname -s) == Linux ]]; then
    symlink gpg-agent_linux.conf "$HOME/.config/gnupg/gpg-agent.conf"
fi

# ------------------------------
# Misc
# ------------------------------

mkdir -p "$HOME/.cache/zsh"
mkdir -p "$HOME/.local/lib"
chmod 0700 "$DOTFILES_ROOT/config/gnupg"

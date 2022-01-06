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

symlink .config/zsh/zshenv "$HOME/.zshenv"
symlink .config/zsh/zshrc "$HOME/.zshrc"

if [[ $(uname -s) == Darwin ]]; then
    symlink "$HOME/.config/gnupg/gpg-agent_darwin.conf" "$HOME/.gnupg/gpg-agent.conf"
    symlink keybindings_darwin.json "$HOME/.config/Code/User/keybindings.json"
    symlink "$HOME/.config/Code/User" "$HOME/Library/Application Support/Code/User"
    symlink "$HOME/.config/pypoetry" "$HOME/Library/Application Support/pypoetry"
elif [[ $(uname -s) == Linux ]]; then
    symlink "$HOME/.config/gnupg/gpg-agent_linux.conf" "$HOME/.gnupg/gpg-agent.conf"
    symlink keybindings_linux.json "$HOME/.config/Code/User/keybindings.json"
    symlink "$HOME/.config/Code/User" "$HOME/.vscode-server/data/Machine"
fi

# ------------------------------
# Misc
# ------------------------------

mkdir -p "$HOME/.cache/zsh"
mkdir -p "$HOME/.local/lib"
chmod 0700 "$HOME/.gnupg"

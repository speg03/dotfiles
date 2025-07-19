#!/usr/bin/env bash

set -eu

DOTFILES_ROOT="$HOME/.local/src/github.com/speg03/dotfiles"
if [[ ! -e $DOTFILES_ROOT ]]; then
    git clone https://github.com/speg03/dotfiles "$DOTFILES_ROOT"
fi

# ------------------------------
# Symbolic links
# ------------------------------

symlink() {
    local src_path="$DOTFILES_ROOT/$1"
    local dst_path=${2:-"$HOME/.$1"}  # 第2引数が省略された場合はHOMEからの相対パスを宛先にする

    if [[ ! -L $dst_path && -e $dst_path ]]; then
        # 宛先がシンボリックリンク以外で存在する場合
        echo "$dst_path already exists."
    else
        mkdir -p "$(dirname "$dst_path")"
        ln -snf "$src_path" "$dst_path"
    fi
}

symlink local/bin/is-online
symlink local/bin/tmux-new-or-switch-session
symlink local/bin/tmux-plugin-manager

symlink config/git/config
symlink config/git/ignore
symlink config/tmux/tmux.conf
symlink config/starship.toml

symlink config/emacs/init.el "$HOME/.emacs.d/init.el"
symlink config/zsh/zshenv "$HOME/.zshenv"
symlink config/zsh/zshrc "$HOME/.zshrc"

if [[ $(uname -s) == Darwin ]]; then
    symlink config/gnupg/gpg-agent_darwin.conf "$HOME/.gnupg/gpg-agent.conf"
    symlink config/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
    symlink config/vscode/keybindings_darwin.json "$HOME/Library/Application Support/Code/User/keybindings.json"
elif [[ $(uname -s) == Linux ]]; then
    symlink config/mise/config.toml
    symlink config/gnupg/gpg-agent_linux.conf "$HOME/.gnupg/gpg-agent.conf"
    symlink config/vscode/settings.json "$HOME/.vscode-server/data/Machine/settings.json"
fi

# ------------------------------
# Misc
# ------------------------------

mkdir -p "$HOME/.cache/zsh"
mkdir -p "$HOME/.local/lib"
mkdir -p "$HOME/.local/share/zsh/site-functions"
chmod 0700 "$HOME/.gnupg"

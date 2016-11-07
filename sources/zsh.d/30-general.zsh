# -*- coding: utf-8; mode: shell-script; -*-

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

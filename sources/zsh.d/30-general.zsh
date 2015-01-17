# -*- coding: utf-8; mode: shell-script; -*-

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

# -*- coding: utf-8; mode: shell-script; -*-

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh.d/completion $fpath)

autoload -Uz add-zsh-hook
autoload -Uz colors
autoload -Uz compinit
autoload -Uz is-at-least
autoload -Uz vcs_info

colors
compinit -u

# -*- coding: utf-8; mode: shell-script; -*-

bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey -s '^jd' "screen -xR\n"

# -*- coding: utf-8; mode: shell-script; -*-

if [ "`uname`" = "Linux" ]; then
    source 71-for_linux.zsh
fi

if [ "`uname`" = "Darwin" ]; then
    source 71-for_mac.zsh
fi

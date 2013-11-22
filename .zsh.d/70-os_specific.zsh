# -*- coding: utf-8; mode: shell-script; -*-

if [ "`uname`" = "Linux" ]; then
    source $HOME/.zsh.d/os_specific/for_linux.zsh
fi

if [ "`uname`" = "Darwin" ]; then
    source $HOME/.zsh.d/os_specific/for_mac.zsh
fi

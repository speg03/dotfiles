# -*- coding: utf-8; mode: shell-script; -*-

alias ls='ls -G'
alias o='open'

alias brew='PATH=$BASEPATH brew'

alias dclean='docker ps -q -f status=exited | xargs docker rm'
alias dcleani='docker images -q -f dangling=true | xargs docker rmi'

alias jnb='FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig jupyter-notebook'

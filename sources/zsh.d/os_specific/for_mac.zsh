# -*- coding: utf-8; mode: shell-script; -*-

alias ls='ls -G'
alias o='open'

alias dclean='docker ps -q -f status=exited | xargs docker rm'
alias dcleani='docker images -q -f dangling=true | xargs docker rmi'

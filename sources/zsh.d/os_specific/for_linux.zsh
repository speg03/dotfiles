# -*- coding: utf-8; mode: shell-script; -*-

alias ls='ls --color=auto'
alias o='xdg-open'

alias dclean='docker ps -q -f status=exited | xargs --no-run-if-empty docker rm'
alias dcleani='docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi'

alias reattach-to-user-namespace=':'

source $HOME/.zsh.d/os_specific/net_tools_deprecated

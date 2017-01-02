alias ls='ls --color=auto'
alias o='xdg-open'

alias dclean='docker ps -q -f status=exited | xargs --no-run-if-empty docker rm'
alias dcleani='docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi'

export TMUX_DEFAULT_COMMAND=""

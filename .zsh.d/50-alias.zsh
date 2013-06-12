# -*- coding: utf-8; mode: shell-script; -*-

alias ll='ls -alF'
alias grep='grep --color=auto -n'
alias e='emacsclient -t'
alias be='bundle exec'
alias kill-emacs="emacsclient -e '(kill-emacs)'"

alias gs='git status'
alias gl='git log'
alias gcn='git clean -dxn'
alias gcf='git clean -dxf'

alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../../..'

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'

alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'

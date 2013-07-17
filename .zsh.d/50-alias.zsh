# -*- coding: utf-8; mode: shell-script; -*-

alias ll='ls -alF'
alias grep='grep --color=auto -n'
alias e='emacsclient -t'
alias kill-emacs="emacsclient -e '(kill-emacs)'"

alias be='bundle exec'
alias tbe='RAILS_ENV=test bundle exec'
alias dbe='RAILS_ENV=development bundle exec'
alias tbe='RAILS_ENV=production bundle exec'

alias gs='git status -sb'
alias gl='git log'
alias gd='git diff'
alias gcn='git clean -dxn'
alias gcf='git clean -dxf'

alias vs='vagrant ssh'
alias vsr='vagrant sandbox rollback'

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

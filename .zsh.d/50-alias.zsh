# -*- coding: utf-8; mode: shell-script; -*-

alias ll='ls -alF'
alias grep='grep --color=auto -n'
alias e='emacsclient -e nil >/dev/null 2>&1 || emacs --daemon; emacsclient -t'
alias kill-emacs="emacsclient -e '(kill-emacs)'"

alias ej='termit en ja'
alias je='termit ja en'

alias be='bundle exec'
alias tbe='RAILS_ENV=test bundle exec'
alias dbe='RAILS_ENV=development bundle exec'
alias pbe='RAILS_ENV=production bundle exec'

alias gs='git status -sb'
alias gl='git log'
alias gd='git diff'
alias gcn='git clean -dxn'
alias gcf='git clean -dxf'

alias ts='tig status'

alias v='vagrant'
alias vs='vagrant status'
alias vss='vagrant sandbox'

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

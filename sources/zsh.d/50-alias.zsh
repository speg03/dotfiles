# -*- coding: utf-8; mode: shell-script; -*-

alias ll='ls -alF'
alias lv='LANG=ja_JP.UTF-8 lv'
alias grep='grep --color=auto -n'
alias e='emacsclient -n'
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
alias t='terraform'

alias d='docker'
alias ds='docker ps'
alias dl='docker ps -lq'
alias di='docker images'

alias d-proxy-build="docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --build-arg no_proxy=$no_proxy"

alias jnb='jupyter-notebook'
alias cdr='cd $(ghq list -p | peco)'
alias gore='GOROOT=$(go env GOROOT) gore'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g P='| peco'

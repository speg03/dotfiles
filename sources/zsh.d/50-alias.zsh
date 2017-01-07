# -*- coding: utf-8; -*-

alias ll='ls -alF'
alias lv='LANG=ja_JP.UTF-8 lv'
alias grep='grep --color=auto -n'

alias be='bundle exec'
alias tbe='RAILS_ENV=test bundle exec'
alias dbe='RAILS_ENV=development bundle exec'
alias pbe='RAILS_ENV=production bundle exec'

alias gs='git status -sb'
alias gl='git log'
alias gd='git diff'

alias d='docker'
alias ds='docker ps'
alias dl='docker ps -lq'
alias di='docker images'

alias d-proxy-build="docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --build-arg no_proxy=$no_proxy"

alias jc='jupyter-console'
alias jnb='jupyter-notebook --ip=0.0.0.0 --no-browser'

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

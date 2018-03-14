### General

alias e='run-emacs -n'
alias t='tmux new-session -A -s main'
alias s='search-file-by-contents'

alias ll='ls -alF'
alias lv='LANG=ja_JP.UTF-8 lv'
alias grep='grep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

### Docker

alias d='docker'
alias dc='docker container'
alias di='docker image'
alias dcom='docker-compose'

alias d-proxy-build='docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} --build-arg no_proxy=${no_proxy}'

### Git

alias gb='git branch -a'
alias gs='git status -s'
alias gl='git log'
alias gd='git diff'
alias gmerged='git branch --merged master | grep -vE "^\*|^  master\$"'
alias gsync='rsync -rltDcvzCP --executability --exclude=".git/" --filter=":- /.gitignore"'

### Python

alias jc='jupyter console'
alias jlab='jupyter lab --ip=0.0.0.0 --no-browser --NotebookApp.token=""'

### Ruby

alias be='bundle exec'
alias tbe='RAILS_ENV=test bundle exec'
alias dbe='RAILS_ENV=development bundle exec'
alias pbe='RAILS_ENV=production bundle exec'

### Global Aliases

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g F='| fzf'
alias -g X='| xargs'

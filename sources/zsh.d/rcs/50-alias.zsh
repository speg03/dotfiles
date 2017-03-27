# -*- coding: utf-8; -*-

### General

alias ll='ls -alF'
alias lv='LANG=ja_JP.UTF-8 lv'
alias grep='grep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

reload() {
    if [[ $TMUX ]]; then
        tmux source-file "$HOME/.tmux.conf"
    fi
    exec "$SHELL" -l
}

### Docker

alias d='docker'
alias dc='docker container'
alias di='docker image'

alias d-proxy-build="docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --build-arg no_proxy=$no_proxy"

### Git

alias gs='git status -s'
alias gl='git log'
alias gd='git diff'
alias gsync='rsync -avzC --exclude=".git/" --filter=":- /.gitignore"'

g() {
    local repo=$(ghq list -p | fzf -1 -q "$*")
    [[ "$repo" ]] && cd "$repo" && echo "$repo"
}

### Python

alias jc='jupyter-console'
alias jnb='jupyter-notebook --ip=0.0.0.0 --no-browser'

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

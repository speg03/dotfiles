alias ls='ls -G'
alias o='open'

alias brew='PATH=$BASEPATH brew'

alias dclean='docker ps -q -f status=exited | xargs docker rm'
alias dcleani='docker images -q -f dangling=true | xargs docker rmi'

alias md5sum='md5'
### General

reload() {
    if [[ $TMUX ]]; then
        tmux source-file "$HOME/.tmux.conf"
    fi
    exec "$SHELL" -l
}

### Network

set-proxy() {
    local proxy_conf
    echo -n 'Proxy (host:port): '
    read proxy_conf

    export http_proxy="http://${proxy_conf}"
    export https_proxy="${http_proxy}"
    export no_proxy='127.0.0.1,localhost'
}

unset-proxy() {
    unset http_proxy
    unset https_proxy
    unset no_proxy
}

print-proxy() {
    echo "export http_proxy=${http_proxy}"
    echo "export https_proxy=${https_proxy}"
    echo "export no_proxy=${no_proxy}"
}

### ZLE

change-repository() {
    local repo=$(ghq list --full-path | fzf --select-1 --query="$LBUFFER")
    if [[ $repo ]]; then
        BUFFER="cd $repo"
        zle accept-line
    fi
    zle -R -c
}
zle -N change-repository

change-worktree() {
    local worktree=$(git-worktree-path)
    if [[ $worktree ]]; then
        BUFFER="cd $worktree"
        zle accept-line
    fi
    zle -R -c
}
zle -N change-worktree

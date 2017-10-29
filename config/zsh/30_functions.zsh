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

save-proxy() {
    {
        echo "export http_proxy=${http_proxy}"
        echo "export https_proxy=${https_proxy}"
        echo "export no_proxy=${no_proxy}"
    } >>"$CONFIG_HOME/zsh/zprofile.local"
}

### Git

gmerged() {
    local branch=${1:-master}
    git branch --merged "$branch" | grep -vE "^\*|^  $branch\$"
}

g() {
    local repo=$(ghq list -p | fzf -1 -q "$*")
    [[ "$repo" ]] && cd "$repo" && echo "$repo"
}

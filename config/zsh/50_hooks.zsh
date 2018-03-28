autoload -Uz add-zsh-hook

_precmd() {
    if [[ -n $TMUX ]]; then
        tmux refresh-client -S
    fi
    _update_prompt
}

add-zsh-hook precmd _precmd

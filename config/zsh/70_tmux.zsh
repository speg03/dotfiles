_set_tmux_status() {
    local sync_symbol=${TMUX_SYNC_SYMBOL:-$'\U1F503 '}
    local sync_status
    sync_status="#{?pane_synchronized,#[fg=brightred],#[fg=white]}"
    sync_status="${sync_status}${sync_symbol}#[fg=default]"

    local status_line
    status_line="#[bg=brightblack]${sync_status}"
    status_line="${status_line}#[fg=brightblack,bg=blue]"$'\UE0B0'
    status_line="${status_line} #[fg=default,bold]#S#[nobold]"
    status_line="${status_line} #[fg=blue,bg=default]"$'\UE0B0'"#[default] "

    tmux set -g status-left "${status_line}"
}

if [[ $TMUX ]]; then
    _set_tmux_status
fi

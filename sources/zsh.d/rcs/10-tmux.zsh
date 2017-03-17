function _set_tmux_status() {
    local sync_symbol=${TMUX_SYNC_SYMBOL:-$'\U1F503 '}
    local sync_enable="#[fg=brightred]"${sync_symbol}"#[default]"
    local sync_disable="#[fg=brightblack]"${sync_symbol}"#[default]"
    tmux set -g status-left "#{?pane_synchronized,$sync_enable,$sync_disable}"
    tmux set -ag status-left "#[fg=cyan](#S)#[default] "
}

if [[ $TMUX ]]; then
    _set_tmux_status
fi

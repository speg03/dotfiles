#!/usr/bin/env zsh

status_left() {
    local sync="#{?pane_synchronized,#[fg=brightred]*, }#[default]"
    local status_line="${sync}#[fg=blue,bold]#S#[default] "

    tmux set-option -g status-left-length 20
    tmux set-option -g status-left "${status_line}"
}


status_right() {
    local time="%m/%d(%a) %H:%M"
    local mem_cpu="#(tmux-mem-cpu-load -i5 -t1 -a0)"
    local status_line="${mem_cpu} | ${time}"

    tmux set-option -g status-right-length 60
    tmux set-option -g status-right "${status_line}"
}


main() {
    tmux set-option -g status-fg white
    tmux set-option -g status-bg default

    tmux set-window-option -g window-status-format " #I "
    tmux set-window-option -g window-status-current-format "[#I]"

    status_left
    status_right
}

main

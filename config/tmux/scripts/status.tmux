#!/usr/bin/env zsh

status_left() {
    local sync
    local status_line

    sync="#{?pane_synchronized,#[fg=brightred],#[fg=white]}"$'\U1F503'"#[fg=default]"

    status_line="#[bg=brightblack]${sync}"
    status_line="${status_line}#[fg=brightblack,bg=blue]"$'\UE0B0'
    status_line="${status_line} #[fg=default,bold]#S#[nobold]"
    status_line="${status_line} #[fg=blue,bg=default]"$'\UE0B0'"#[default] "

    status_line=$(print -P "${status_line}")

    tmux set-option -g status-left-length 20
    tmux set-option -g status-left "${status_line}"
}


status_right() {
    local mem_cpu
    local status_line

    local fg=black
    local bg=brightwhite
    local time="%%m/%%d(%%a) %%H:%%M"

    mem_cpu="#(tmux-mem-cpu-load -cq -i5 -t1 -a0)"
    status_line=$(print -P "#[fg=${bg}]"$'\UE0B2'"#[fg=${fg},bg=${bg}] ${time} #[default]")

    tmux set-option -g status-right-fg brightblack
    tmux set-option -g status-right-length 60
    tmux set-option -g status-right "${mem_cpu} ${status_line}"
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

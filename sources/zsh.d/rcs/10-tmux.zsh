## Start tmux session
if [ "$TERM" != "screen-256color" ]; then
    debug "Starting tmux new session ..."
    exec tmux new-session -A -s main
fi

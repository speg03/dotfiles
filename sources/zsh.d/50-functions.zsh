### Emacs

function e() {
    if emacsclient -e nil &>/dev/null; then
        emacsclient -n "$@"
    else
        emacsclient -a '' -nc "$@"
    fi
}

function kill-emacs() {
    emacsclient -e '(kill-emacs)'
}

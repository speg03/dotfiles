### Color

function color_map() {
    local color
    local formatted_number

    for color in $(seq 0 255); do
        formatted_number=$(printf '%3d' $color)
        print -Pn " %F{$color}$formatted_number%f"
        if [ $(expr $color % 8) -eq 7 ]; then
            echo
        fi
    done
}

function hostname_color() {
    # Convert hostname to number (0 - 255)
    local hostname_hash=$(hostname | md5sum | cut -c1-2)
    local hostname_hash_number=$(printf '%d' 0x$hostname_hash)
    # Valid color range: 25 - 231
    local valid_color=$(expr $hostname_hash_number % \( 232 - 25 \) + 25)
    echo -n $valid_color
}


### Emacs

function e() {
    local frame_count=$(emacsclient -a '' -e '(length (visible-frame-list))')
    if [ $frame_count -lt 2 ]; then
        emacsclient -nc "$@"
    else
        emacsclient -n "$@"
    fi
}

function kill_emacs() {
    emacsclient -e '(kill-emacs)'
}


### Repository

function g() {
    local repo=$(ghq list -p | fzf -1 -q "$*")
    [ "$repo" ] && cd $repo && echo $repo
}


### Searching file contents

function s() {
    ag --noheading . |
        fzf -d: --tac -q "$*" \
            --bind "enter:execute: pygmentize {1} | less +{2}"
}


### Tmux

function t() {
    local session=${1:-main}
    if [[ -z $TMUX ]]; then
        tmux new-session -A -s $session
    else
        if ! tmux has-session -t $session 2>/dev/null; then
            TMUX= tmux new-session -d -s $session
        fi
        tmux switch-client -t $session
    fi
}

function tkill() {
    tmux list-sessions 2>/dev/null |
        fzf-tmux -m -0 |
        cut -d: -f1 |
        xargs -n 1 tmux kill-session -t
}

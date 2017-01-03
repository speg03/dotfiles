### Color

function print_colors() {
    for color in $(seq 0 255); do
        formatted_number=$(printf '%3d' $color)
        print -Pn "%F{$color}$formatted_number%f "
    done
    echo
}

function hostname_color() {
    # Convert hostname to number (0 - 255)
    hostname_hash_number=$(printf '%d' 0x$(hostname | md5sum | cut -c1-2))
    # Valid color range: 25 - 231
    valid_color=$(expr $hostname_hash_number % \( 232 - 25 \) + 25)
    echo -n $valid_color
}


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

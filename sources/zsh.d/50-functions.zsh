### Color

function color_map() {
    for color in $(seq 0 255); do
        if [ $(expr $color % 8) -eq 0 ]; then
            echo
        fi
        formatted_number=$(printf '%3d' $color)
        print -Pn " %F{$color}$formatted_number%f"
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
    frames=$(emacsclient --eval '(length (visible-frame-list))' 2>/dev/null)
    if [ -z "$frames" -o $frames -lt 2 ]; then
        emacsclient --alternate-editor='' --create-frame --no-wait "$@"
    else
        emacsclient --no-wait "$@"
    fi
}

function kill-emacs() {
    emacsclient --eval '(kill-emacs)'
}

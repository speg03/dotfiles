## Load OS specific configuration
# OS: Linux, Darwin(macOS)
if [[ -e $HOME/.zsh.d/rcs/os_specific/$(uname -s).zsh ]]; then
    debug "$HOME/.zsh.d/rcs/os_specific/$(uname -s).zsh"
    source $HOME/.zsh.d/rcs/os_specific/$(uname -s).zsh
fi

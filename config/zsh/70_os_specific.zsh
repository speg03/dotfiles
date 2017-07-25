## Load OS specific configuration
# OS: Linux, Darwin(macOS)
if [[ -e $HOME/.config/zsh/os_specific/$(uname -s).zsh ]]; then
    debug "$HOME/.config/zsh/os_specific/$(uname -s).zsh"
    source $HOME/.config/zsh/os_specific/$(uname -s).zsh
fi

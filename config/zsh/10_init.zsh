### Applications

if [[ $TERM != "screen-256color" ]]; then
    export TERM="xterm-256color"
fi

export EDITOR="run-emacs"

export ANYENV_ROOT="$HOME/.local/share/anyenv"
export GOPATH="$HOME/.local/lib/go"
export JUPYTER_CONFIG_DIR="$HOME/.config/jupyter"
export LESS="-giMR"
export PIP_CONFIG_FILE="$HOME/.config/pip/pip.conf"
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.local/share/tmux/plugins"

# Suppress password dialogs
# default: SSH_ASKPASS=/usr/libexec/openssh/gnome-ssh-askpass
unset SSH_ASKPASS


### History

export HISTFILE="$HOME/.cache/zsh/zhistory"
export HISTSIZE=10000
export SAVEHIST=10000


### PATH

typeset -xU path
typeset -axUT BASEPATH basepath

basepath=(
    /home/{linuxbrew,$USER}/.linuxbrew/bin(N-/)
    {/usr/local,/usr,}/bin(N-/)
    {/usr/local,/usr,}/sbin(N-/)
)
path=(
    $HOME/.poetry/bin(N-/)
    $HOME/.local/lib/google-cloud-sdk/bin(N-/)
    $GOPATH/bin(N-/)
    $basepath
)

if type anyenv &>/dev/null; then
    eval "$(anyenv init -)"
fi

path=($HOME/.local/bin(N-/) $path)

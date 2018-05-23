### Applications

if [[ $TERM != "screen-256color" ]]; then
    export TERM="xterm-256color"
fi

export EDITOR="run-emacs"

export ANYENV_ROOT="$SRC_HOME/github.com/riywo/anyenv"
export GOPATH="$LIB_HOME/go"
export JUPYTER_CONFIG_DIR="$CONFIG_HOME/jupyter"
export LESS="-giMR"
export PIP_CONFIG_FILE="$CONFIG_HOME/pip/pip.conf"
export PIPENV_VENV_IN_PROJECT=true
export TMUX_PLUGIN_MANAGER_PATH="$DATA_HOME/tmux/plugins"

# Suppress password dialogs
# default: SSH_ASKPASS=/usr/libexec/openssh/gnome-ssh-askpass
unset SSH_ASKPASS


### History

export HISTFILE="$CACHE_HOME/zsh/zhistory"
export HISTSIZE=10000
export SAVEHIST=10000


### PATH

typeset -xU path
typeset -axUT BASEPATH basepath

basepath=({/usr/local,/usr,}/bin(N-/) {/usr/local,/usr,}/sbin(N-/))
path=($GOPATH/bin(N-/) $basepath)

if [[ -e $ANYENV_ROOT/bin/anyenv ]]; then
    eval "$($ANYENV_ROOT/bin/anyenv init -)"
fi

path=($BIN_HOME(N-/) $path)

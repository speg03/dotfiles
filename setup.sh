#!/bin/sh

cd $(dirname $0)

## Check if required packages exist
packages="curl git go zsh"
for package in $packages; do
    if ! type $package &>/dev/null; then
        require_packages="$require_packages $package"
    fi
done

if [ -n "$require_packages" ]; then
    echo "!!! You need to install packages:$require_packages"
    exit 1
fi

## Create symbolic links of dotfiles at HOME
find sources -maxdepth 1 -mindepth 1 \
    -exec sh -c 'ln -snf $(pwd)/{} $HOME/.$(basename {})' \;

## completion for zsh
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh \
     -o $HOME/.zsh.d/completion/_git
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
     -o $HOME/.zsh.d/completion/git-completion.bash
curl https://raw.githubusercontent.com/docker/docker/master/contrib/completion/zsh/_docker \
     -o $HOME/.zsh.d/completion/_docker

## anyenv
if [ ! -e $HOME/.anyenv ]; then
    git clone https://github.com/riywo/anyenv $HOME/.anyenv
    mkdir -p $HOME/.anyenv/plugins
    git clone https://github.com/znz/anyenv-update $HOME/.anyenv/plugins/anyenv-update
fi

## tpm
if [ ! -e $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

## tools
. $HOME/.zprofile
go get -u github.com/Songmu/ghg/cmd/ghg

go get -u github.com/motemen/gore
go get -u github.com/nsf/gocode
go get -u github.com/k0kubun/pp
go get -u golang.org/x/tools/cmd/godoc

## git config
if [ ! -e $HOME/.gitconfig.local ]; then
    git config -f $HOME/.gitconfig.local user.name 'Takahiro Yano'
    git config -f $HOME/.gitconfig.local user.email 'speg03@gmail.com'
fi

#!/bin/sh

dotfiles=${HOME}/.ghq/github.com/speg03/dotfiles
if [ ! -e ${dotfiles} ]; then
    git clone https://github.com/speg03/dotfiles.git ${dotfiles}
else
    cd ${dotfiles}
    git pull
fi

${dotfiles}/setup.sh

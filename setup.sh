#!/bin/sh

cd `dirname $0`
basedir=`pwd`

DOTFILES=`cat <<EOT
  .emacs.d
  .zshrc
  .zsh.d
  .zprofile
  .gitconfig
  .tmux.conf
EOT
`

## enable configuration
for rc in $DOTFILES
do
    ln -snf $basedir/$rc $HOME
done

## enable git-completion for zsh
if [ "`uname`" = "Linux" ]; then
    cd $basedir/.zsh.d/completion
    curl -L https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh -o _git
    curl -LO https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
fi

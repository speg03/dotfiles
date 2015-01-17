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
  .bundle
EOT
`

## enable configuration
for rc in $DOTFILES
do
    ln -snf $basedir/$rc $HOME
done

## enable completion for zsh
if [ "$(uname)" = "Linux" ]; then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh \
        -o $HOME/.zsh.d/completion/_git
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
        -o $HOME/.zsh.d/completion/git-completion.bash
    curl https://raw.githubusercontent.com/docker/docker/master/contrib/completion/zsh/_docker \
        -o $HOME/.zsh.d/completion/_docker
fi

## rbenv
if [ ! -e $HOME/.rbenv ]; then
    git clone https://github.com/sstephenson/rbenv $HOME/.rbenv
    git clone https://github.com/sstephenson/ruby-build $HOME/.rbenv/plugins/ruby-build
fi

#!/bin/sh

fullpath=`readlink -e $0`
basedir=`dirname $fullpath`

## Emacsの設定
cd $basedir
ln -sf `readlink -e .emacs.d` $HOME

cd .emacs.d/elisp
curl -LO http://www.emacswiki.org/emacs/download/auto-install.el
curl -LO https://gist.github.com/raw/1021706/b9aff51e7e40afa7abb3c7d6ef7708993ad93b04/init-loader.el
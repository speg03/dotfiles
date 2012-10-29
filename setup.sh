#!/bin/sh

fullpath=`readlink -e $0`
basedir=`dirname $fullpath`

## 各設定の有効化
cd $basedir
ln -sf \
  `readlink -e .emacs.d` \
  `readlink -e .zshrc` \
  `readlink -e .zprofile` \
  `readlink -e .screenrc` \
  `readlink -e .gitconfig` \
  $HOME


## Emacsの設定

cd $basedir/.emacs.d/archives

# howm: http://howm.sourceforge.jp/index-j.html
curl -LO http://howm.sourceforge.jp/a/howm-1.4.0.tar.gz
tar xzf howm-1.4.0.tar.gz
cd howm-1.4.0
./configure
make
sudo make install


cd $basedir/.emacs.d/elisp

# auto-install: http://d.hatena.ne.jp/rubikitch/20091221/autoinstall
curl -LO http://www.emacswiki.org/emacs/download/auto-install.el

# 修正版 init-loader.el: https://gist.github.com/1021706
curl -LO https://gist.github.com/raw/1021706/b9aff51e7e40afa7abb3c7d6ef7708993ad93b04/init-loader.el

# markdown: http://jblevins.org/projects/markdown-mode/
curl -LO http://jblevins.org/projects/markdown-mode/markdown-mode.el
echo '** Install pandoc'

# auto-async-byte-compile: http://d.hatena.ne.jp/rubikitch/20100423/bytecomp
echo '** Install auto-async-byte-compile:'
echo 'M-x install-elisp-from-emacswiki auto-async-byte-compile.el'

# -*- coding: utf-8; -*-

function _update_term_title() {
    # xtermのタイトルに現在のディレクトリパスを設定
    print -Pn "\e]0;%~\a"
}

if [ -n "$TMUX" ]; then
    add-zsh-hook chpwd _update_term_title
    _update_term_title
fi

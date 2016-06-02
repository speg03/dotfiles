# -*- coding: utf-8; mode: shell-script; -*-

function _update_term_title() {
    # xtermのタイトルに現在のディレクトリパスを設定
    print -Pn "\e]0;%~\a"
}

if [ "$TERM" = "screen" ]; then
    add-zsh-hook chpwd _update_term_title
    _update_term_title
fi

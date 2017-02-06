# -*- coding: utf-8; -*-

function _update_term_title() {
    local current_path=$(print -Pn '%~')

    # 現在のパスを後ろから58文字以内に収める
    if [[ ${#current_path} > 58 ]]; then
        # ドット3つ分を引いて55文字に縮める
        local start=$(( ${#current_path} - 55 + 1 ))
        current_path=...${current_path[$start,-1]}
    fi

    # xtermのタイトルに現在のディレクトリパスを設定
    print -Pn "\e]0;$current_path\a"
}

if [ -n "$TMUX" ]; then
    add-zsh-hook chpwd _update_term_title
    _update_term_title
fi

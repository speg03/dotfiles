# -*- coding: utf-8; -*-

zstyle ':vcs_info:*' max-exports 4
zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:git:*' formats '%b' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b' '%c' '%u' '%a'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr 'A'    # %c で表示する文字列
zstyle ':vcs_info:git:*' unstagedstr 'M'  # %u で表示する文字列

### ベースのプロンプト
function _base_prompt() {
    if [ -z "$HOSTNAME_COLOR" ]; then
        HOSTNAME_COLOR=$(hostname_color)
    fi
    print -Pn "%F{$HOSTNAME_COLOR}%n@%m%f:%F{yellow}%1~%f"
}

function _vcs_info_prompt() {
    local vcs_message

    LANG=en_US.UTF-8 vcs_info
    if [ -z "${vcs_info_msg_0_}" ]; then
        # vcs_info で何も取得していない場合は何も表示しない
        return 0
    fi

    ### ブランチ名
    vcs_message="%F{cyan}(${vcs_info_msg_0_})%f "

    ### staged/unstaged な変更がある場合
    [ -n "${vcs_info_msg_1_}" ] && vcs_message+="%F{green}${vcs_info_msg_1_}%f"
    [ -n "${vcs_info_msg_2_}" ] && vcs_message+="%F{red}${vcs_info_msg_2_}%f"

    ### conflict などのメッセージがある場合
    [ -n "${vcs_info_msg_3_}" ] && vcs_message+=" %F{red}${vcs_info_msg_3_}%f"

    print -Pn ${vcs_message}
}

function _update_prompt() {
    PROMPT="$(_base_prompt) $(_vcs_info_prompt)"$'\n%(!.%F{red}#%f.$) '
}
add-zsh-hook precmd _update_prompt

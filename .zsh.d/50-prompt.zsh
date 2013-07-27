# -*- coding: utf-8; mode: shell-script; -*-

zstyle ':vcs_info:*' max-exports 5
zstyle ':vcs_info:*' enable git

if is-at-least 4.3.10; then
    zstyle ':vcs_info:git:*' formats '%b' '%c' '%u' '%m'
    zstyle ':vcs_info:git:*' actionformats '%b' '%c' '%u' '%m' '%a'
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr 'A'    # %c で表示する文字列
    zstyle ':vcs_info:git:*' unstagedstr 'M'  # %u で表示する文字列
fi

function _base_prompt() {
    print -Pn '%F{green}%n@%m%f:%F{yellow}%1~%f'
}

function _vcs_info_prompt() {
    local vcs_message
    local vcs_b
    local vcs_c
    local vcs_u
    local vcs_m
    local vcs_a

    LANG=en_US.UTF-8 vcs_info

    if [ -z "${vcs_info_msg_0_}" ]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        vcs_message=""
    else
        vcs_b="%F{cyan}(${vcs_info_msg_0_})%f "
        [ -n "${vcs_info_msg_1_}" ] && vcs_c="%F{green}${vcs_info_msg_1_}%f"
        [ -n "${vcs_info_msg_2_}" ] && vcs_u="%F{red}${vcs_info_msg_2_}%f"
        [ -n "${vcs_info_msg_3_}" ] && vcs_m="%F{yellow}${vcs_info_msg_3_}%f"
        [ -n "${vcs_info_msg_4_}" ] && vcs_a=" %F{red}<!${vcs_info_msg_4_}>%f"

        vcs_message="${vcs_b}${vcs_c}${vcs_u}${vcs_m}${vcs_a}"
    fi

    print -Pn ${vcs_message}
}

function _update_prompt() {
    PROMPT="`_base_prompt` `_vcs_info_prompt`"$'\n%(!.%F{red}#%f.$) '
}
add-zsh-hook precmd _update_prompt

# -*- coding: utf-8; mode: shell-script; -*-

zstyle ':vcs_info:*' max-exports 4
zstyle ':vcs_info:*' enable git

if is-at-least 4.3.10; then
    zstyle ':vcs_info:git:*' formats '%b' '%c' '%u'
    zstyle ':vcs_info:git:*' actionformats '%b' '%c' '%u' '%a'
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr 'A'    # %c で表示する文字列
    zstyle ':vcs_info:git:*' unstagedstr 'M'  # %u で表示する文字列
fi

### ベースのプロンプト
function _base_prompt() {
    print -Pn '%F{green}%n@%m%f:%F{yellow}%1~%f'
}

### merge, pushしていないコミットがある場合
function _vcs_info_remote_prompt() {
    local remote_mark
    ### git fetch して merge していないコミットがある場合
    if command git status -b --porcelain | \grep '^##.*behind' >/dev/null 2>&1; then
        remote_mark='F'
    fi
    ### git commit して push していないコミットがある場合
    if command git status -b --porcelain | \grep '^##.*ahead' >/dev/null 2>&1; then
        remote_mark+='C'
    fi

    [ -n "$remote_mark" ] && print -Pn "%F{magenta}$remote_mark%f"
}

### untracked なファイルがある場合
function _vcs_info_untracked_prompt() {
    if command git status --porcelain | \grep '^??' >/dev/null 2>&1; then
        print -Pn "%F{yellow}?%f"
    fi
}

function _vcs_info_prompt() {
    local vcs_message

    LANG=en_US.UTF-8 vcs_info

    if [ -z "${vcs_info_msg_0_}" ]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        vcs_message=""
    else
        # 各状態のマークを連結する
        vcs_message="%F{cyan}(${vcs_info_msg_0_})%f "
        vcs_message+=`_vcs_info_remote_prompt`
        [ -n "${vcs_info_msg_1_}" ] && vcs_message+="%F{green}${vcs_info_msg_1_}%f"
        [ -n "${vcs_info_msg_2_}" ] && vcs_message+="%F{red}${vcs_info_msg_2_}%f"
        vcs_message+=`_vcs_info_untracked_prompt`
        [ -n "${vcs_info_msg_3_}" ] && vcs_message+="%F{red}${vcs_info_msg_3_}%f"
    fi

    print -Pn ${vcs_message}
}

function _update_prompt() {
    PROMPT="`_base_prompt` `_vcs_info_prompt`"$'\n%(!.%F{red}#%f.$) '
}
add-zsh-hook precmd _update_prompt

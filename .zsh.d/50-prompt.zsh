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

### ブランチ名
function _vcs_info_branch_prompt() {
    if [ -n "$1" ]; then
        print -Pn "%F{cyan}($1)%f"
    fi
}

### staged
function _vcs_info_staged_prompt() {
    print -Pn '%F{green}'

    ### git fetch して merge していないコミットがある場合
    if command git status -b --porcelain | \grep '^##.*behind' >/dev/null 2>&1; then
        print -Pn 'F'
    fi

    ### git commit して push していないコミットがある場合
    if command git status -b --porcelain | \grep '^##.*ahead' >/dev/null 2>&1; then
        print -Pn 'C'
    fi

    ### staged なファイルがある場合
    if [ -n "$1" ]; then
        print -Pn "$1"
    fi
    print -Pn '%f'
}

### unstaged なファイルがある場合
function _vcs_info_unstaged_prompt() {
    if [ -n "$1" ]; then
        print -Pn "%F{red}$1%f"
    fi
}

### untracked なファイルがある場合
function _vcs_info_untracked_prompt() {
    if command git status --porcelain | \grep '^??' >/dev/null 2>&1; then
        print -Pn "%F{yellow}?%f"
    fi
}

### conflict などが起こった場合
function _vcs_info_action_prompt() {
    if [ -n "$1" ]; then
        print -Pn "%F{red}<!$1>%f"
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
        vcs_message="`_vcs_info_branch_prompt ${vcs_info_msg_0_}` "
        vcs_message+="`_vcs_info_staged_prompt ${vcs_info_msg_1_}`"
        vcs_message+="`_vcs_info_unstaged_prompt ${vcs_info_msg_2_}`"
        vcs_message+="`_vcs_info_untracked_prompt`"
        vcs_message+=" `_vcs_info_action_prompt ${vcs_info_msg_3_}`"
    fi

    print -Pn ${vcs_message}
}

function _update_prompt() {
    PROMPT="`_base_prompt` `_vcs_info_prompt`"$'\n%(!.%F{red}#%f.$) '
}
add-zsh-hook precmd _update_prompt

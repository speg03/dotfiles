# -*- coding: utf-8; -*-

zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:git:*' formats \
       '%F{cyan}(%b)%f %F{green}%c%f%F{red}%u%f%m '
zstyle ':vcs_info:git:*' actionformats \
       '%F{cyan}(%b)%f %F{green}%c%f%F{red}%u%f%m%F{red}!%a%f '
zstyle ':vcs_info:git:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks \
       vcs-init git-untracked git-st vcs-green

function +vi-vcs-init() {
    local in_git
    in_git=$(git rev-parse --is-inside-work-tree 2>/dev/null)
    if [[ $in_git != 'true' ]]; then
        # skip other hooks
        return 1
    fi
    hook_com[misc]=''
}

function +vi-git-untracked() {
    if git status --porcelain | grep '^??' &>/dev/null; then
        hook_com[misc]+="%F{yellow}?%f"
    fi
}

function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null \
                | wc -l | awk '{print $1}')
    (( $ahead )) && gitstatus+=( "+${ahead}" )

    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null \
                 | wc -l | awk '{print $1}')
    (( $behind )) && gitstatus+=( "-${behind}" )

    if [[ ${#gitstatus[@]} -gt 0 ]]; then
        hook_com[misc]+="%F{magenta}[${(j:/:)gitstatus}]%f"
    fi
}

function +vi-vcs-green() {
    if [[ -z ${hook_com[staged]} && -z ${hook_com[unstaged]} &&
              -z ${hook_com[misc]} && -z ${hook_com[action]} ]]; then
        hook_com[misc]=$'%F{green}\U2714%f'
    fi
}

function _update_term_title() {
    # xtermのタイトルに現在のディレクトリパスを設定
    # ただし、58文字に収める（tmux.confの設定による）
    print -Pn "\e]0;%58<...<%~%<<\007"
}

function _update_prompt() {
    local color=${HOSTNAME_COLOR:-$(hostname_color)}
    local symbol=${PROMPT_SYMBOL:-$'%F{11}\U26A1%f  '}

    LANG=en_US.UTF-8 vcs_info
    PROMPT="[%F{$color}%n@%m%f]$symbol"
    RPROMPT="${vcs_info_msg_0_}"
}

if [[ $TERM == 'screen-256color' ]]; then
    add-zsh-hook chpwd _update_term_title
    _update_term_title
fi

add-zsh-hook precmd _update_prompt

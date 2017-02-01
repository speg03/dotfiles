# -*- coding: utf-8; -*-

zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:git:*' formats \
       '%F{cyan}(%b)%f %F{green}%c%f%F{red}%u%f%m'
zstyle ':vcs_info:git:*' actionformats \
       '%F{cyan}(%b)%f %F{green}%c%f%F{red}%u%f%m%F{red}<!%a>%f'
zstyle ':vcs_info:git:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks reset-misc git-st vcs-green

function +vi-reset-misc() {
    hook_com[misc]=''
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

    if [[ ${#gitstatus[@]} > 0 ]]; then
        hook_com[misc]+="%F{magenta}[${(j:/:)gitstatus}]%f"
    fi
}

function +vi-vcs-green() {
    if [[ -z ${hook_com[staged]} && -z ${hook_com[unstaged]} &&
              -z ${hook_com[misc]} && -z ${hook_com[action]} ]]; then
        hook_com[misc]="%F{green}✔%f"
    fi
}

function _update_prompt() {
    local base_prompt
    local vcs_prompt

    if [ -z "$HOSTNAME_COLOR" ]; then
        HOSTNAME_COLOR=$(hostname_color)
    fi
    base_prompt="%F{$HOSTNAME_COLOR}%n@%m%f:%F{yellow}%1~%f"

    LANG=en_US.UTF-8 vcs_info
    if [ -n "${vcs_info_msg_0_}" ]; then
        vcs_prompt="${vcs_info_msg_0_}"
    fi
    PROMPT="$base_prompt $vcs_prompt"$'\n%(!.%F{red}#%f.$) '
}

add-zsh-hook precmd _update_prompt

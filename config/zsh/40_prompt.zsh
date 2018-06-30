autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:git:*' formats \
       '%b %F{green}%c%f%F{red}%u%f%m'
zstyle ':vcs_info:git:*' actionformats \
       '%b %F{green}%c%f%F{red}%u%f%m%F{red}!%a%f'
zstyle ':vcs_info:git:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks \
       vcs-init git-untracked git-st vcs-green

+vi-vcs-init() {
    local in_git
    in_git=$(git rev-parse --is-inside-work-tree 2>/dev/null)
    if [[ $in_git != 'true' ]]; then
        # skip other hooks
        return 1
    fi
    hook_com[misc]=''
}

+vi-git-untracked() {
    if git status --porcelain | grep '^??' &>/dev/null; then
        hook_com[misc]+="%F{yellow}?%f"
    fi
}

+vi-git-st() {
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

+vi-vcs-green() {
    if [[ -z ${hook_com[staged]} && -z ${hook_com[unstaged]} &&
              -z ${hook_com[misc]} && -z ${hook_com[action]} ]]; then
        hook_com[misc]=$'%F{green}\U2714%f'
    fi
}

_update_prompt() {
    local sep=$'%F{248}\UE0B1%f'
    local user_host="%F{green}%n@%m%f"
    local current_path="%F{yellow}%30<...<%~%<<%f"
    local prompt_info git_status

    prompt_info="${current_path}"

    LANG=en_US.UTF-8 vcs_info
    if [[ -n $vcs_info_msg_0_ ]]; then
        git_status="%F{cyan}git:${vcs_info_msg_0_}%f"
        prompt_info="${prompt_info} ${sep} ${git_status}"
    fi

    PROMPT="%K{238} ${user_host} %k"$'%F{238}\UE0B0%f\n$ '
    RPROMPT="${prompt_info}"
}

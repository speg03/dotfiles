_update_prompt() {
    local prompt_info="%F{$(print -P %n@%m | hash-number 6 1)}%n@%m%f"
    local sep=$'%F{248}\UE0B1%f'

    PROMPT="%K{238} ${prompt_info} %k"$'%F{238}\UE0B0%f\n$ '
}

_pyenv_version() {
    local version=$PYENV_VERSION
    if [[ ! $version ]]; then
        version=$(pyenv local 2>/dev/null)
    fi
    echo -n $version
}

_update_prompt() {
    local prompt_info="%F{$(print -P %n@%m | hash-number 6 1)}%n@%m%f"
    local sep=$'%F{248}\UE0B1%f'

    local pyenv_version=$(_pyenv_version)
    if [[ $pyenv_version ]]; then
        pyenv_version="%F{yellow}pyenv:${pyenv_version}%f"
        prompt_info="${prompt_info} ${sep} ${pyenv_version}"
    fi

    PROMPT="%K{238} ${prompt_info} %k"$'%F{238}\UE0B0%f\n$ '
}

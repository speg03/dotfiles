_install_default_packages() {
    pip install -U pip setuptools
    pip install -r "${CONFIG_HOME}/pyenv/requirements.txt"
}

# shellcheck disable=SC2016
after_virtualenv 'PYENV_VERSION="${VIRTUALENV_NAME}" _install_default_packages'

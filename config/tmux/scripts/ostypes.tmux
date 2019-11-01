#!/usr/bin/env bash

ostype="$(uname -s | tr "[:upper:]" "[:lower:]")"
osconf="${HOME}/.config/tmux/${ostype}.conf"

tmux display-message "Loading ${osconf}"\; source-file "${osconf}"

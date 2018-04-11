#!/usr/bin/env bash

ostype="$(uname -s | tr "[:upper:]" "[:lower:]")"
osconf="${CONFIG_HOME}/tmux/${ostype}.conf"

tmux display-message "Loading ${osconf}"\; source-file "${osconf}"

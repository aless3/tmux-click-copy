#!/usr/bin/env bash

# Double & Triple click taken and modified from ideasman dotfiles with an async timer
# https://gitlab.com/ideasman42/dotfiles
# This plugin for now ships only the bash script used and an example config.
# the config must be put in the tmux config file, I cannot make it work if sourcing with bash

TMUX_CLICK_COPY_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMUX_CLICK_COPY="$TMUX_CLICK_COPY_PATH/scripts/tmux_click_copy.sh"

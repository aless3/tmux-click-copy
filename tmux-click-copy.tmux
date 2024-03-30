#!/usr/bin/env bash

TCC_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TCC_BIN="$TCC_PATH/scripts/tmux_click_copy.sh"

source "$TCC_PATH/scripts/helpers.sh"

TCC_DEFAULT_TIMEOUT="1.5"
TIMEOUT=$( get_tmux_option "@tcc_timeout" "$TCC_DEFAULT_TIMEOUT" )

TCC_COMMAND="${TCC_BIN} #{pane_id} #{selection_start_x} #{selection_start_y} #{selection_end_x} #{selection_end_y} ${TIMEOUT} > /dev/null &"


# Double & Triple click taken and modified from ideasman dotfiles with an async timer
# https://gitlab.com/ideasman42/dotfiles

# Double LMB Select & Copy (Word)
tmux bind-key -T copy-mode DoubleClick1Pane \
    select-pane \\\; \
    send-keys -X select-word \\\; \
    send-keys -X copy-selection-no-clear \\\; \
    run-shell "${TCC_COMMAND}"

tmux bind-key -T root DoubleClick1Pane \
    select-pane -t = \\\; \
    if-shell -F "#{||:#{pane_in_mode},#{mouse_any_flag}}" \
        "send-keys -M"  \
        "copy-mode -H ; \
            send-keys -X select-word ; \
            send-keys -X copy-selection-no-clear ; \
            run-shell \"${TCC_COMMAND}\" "


# Triple LMB Select & Copy (Line)
tmux bind-key -T copy-mode TripleClick1Pane \
    select-pane \\\; \
    send-keys -X select-line \\\; \
    send-keys -X copy-selection-no-clear \\\; \
    run-shell "${TCC_COMMAND}"

tmux bind-key -n TripleClick1Pane \
    select-pane -t = \\\; \
    if-shell -F "#{||:#{pane_in_mode},#{mouse_any_flag}}" \
    "send-keys -M" \
    "copy-mode -H ; \
        send-keys -X select-line ; \
        send-keys -X copy-selection-no-clear ; \
        run-shell \"${TCC_COMMAND}\" "

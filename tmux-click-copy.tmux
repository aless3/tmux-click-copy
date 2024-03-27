#!/usr/bin/env bash

# Double & Triple click taken and modified from ideasman dotfiles with an async timer
# https://gitlab.com/ideasman42/dotfiles

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind-key T run-shell "$CURRENT_DIR/scripts/tmux_list_plugins.sh"

# Double LMB Select & Copy (Word)
tmux bind-key -T copy-mode DoubleClick1Pane \
    select-pane \; \
    send -X select-word \; \
    send -X copy-pipe-no-clear \; \
    run 'echo $CURRENT_DIR > tmp' \; \
    run "$CURRENT_DIR/scripts/tmux_exit_copy #{pane_id} #{selection_start_x} #{selection_start_y} #{selection_end_x} #{selection_end_y} > /dev/null &"

tmux bind-key -T root DoubleClick1Pane \
    select-pane -t = \; \
    if -F "#{||:#{pane_in_mode},#{mouse_any_flag}}" \
        { send -M } \
        { copy-mode -H ; \
            send -X select-word ; \
            send -X copy-pipe-no-clear ; \
    run 'echo $CURRENT_DIR > tmp' \; \
            run "$CURRENT_DIR/scripts/tmux_exit_copy #{pane_id} #{selection_start_x} #{selection_start_y} #{selection_end_x} #{selection_end_y} > /dev/null &" }

# Triple LMB Select & Copy (Line)
tmux bind-key -T copy-mode TripleClick1Pane \
    select-pane \; \
    send -X select-line \; \
    send -X copy-pipe-no-clear \; \
    run 'echo $CURRENT_DIR > tmp' \; \
    run "$CURRENT_DIR/scripts/tmux_exit_copy #{pane_id} #{selection_start_x} #{selection_start_y} #{selection_end_x} #{selection_end_y} > /dev/null &"

tmux bind-key -n TripleClick1Pane \
    select-pane \; \
    copy-mode -M \; \
    send-keys -X select-line \; \
    send-keys -X copy-pipe-no-clear \; \
    run 'echo $CURRENT_DIR > tmp' \; \
    run "$CURRENT_DIR/scripts/tmux_exit_copy #{pane_id} #{selection_start_x} #{selection_start_y} #{selection_end_x} #{selection_end_y} > /dev/null &"

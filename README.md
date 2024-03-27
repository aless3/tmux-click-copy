# tmux_click_copy

This plugin rebind DoubleClick1Pane and TripleClick1Pane in the root and copy-mode key-tables with the default (when mouse on) with the addition to not stop the selection upon releasing the mouse and starting an async timer of 1.5 seconds to stop the selection and exit copy mode if it remains unaltered after the timer ends.

This enables to drag to extend the selection with double or triple click with the 'word-selection' and 'line-selection', but also does not leave the pane in copy mode if using just a double (or triple) click to select just the word or the line without dragging the mouse

Double & Triple click taken and modified from [ideasman dotfiles](https://gitlab.com/ideasman42/dotfiles) with the addition of a bash script that after a timeout exits copy-mode if the selection has not changed

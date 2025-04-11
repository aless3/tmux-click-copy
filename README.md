# tmux_click_copy

This plugin rebinds `DoubleClick1Pane` and `TripleClick1Pane` in the root and copy-mode key-tables with the default (when mouse on) with the addition to not stop the selection upon releasing the mouse and starting an async timer of 0.5/0.7 seconds to stop the selection and exit copy mode if it remains unaltered after the timer ends.

This enables to drag to extend the selection with double or triple click with the 'word-selection' and 'line-selection' way of selecting, but also does not leave the pane in copy mode if using just a double (or triple) click to select just the word or the line without dragging the mouse.

Double & Triple click base taken and modified from [ideasman dotfiles](https://gitlab.com/ideasman42/dotfiles) with the addition of a bash script that after a timeout exits copy-mode if the selection has not changed.

# Usage
Install this plugin via the [tmux plugin manager](https://github.com/tmux-plugins/tpm) adding this to your tmux configuration file:
``` shell
set -g @plugin "aless3/tmux-click-copy"
```
Send `prefix+I` to fetch and install the plugin and source it.
The default timeout after which this plugin copies the selection and exits copy mode is 0.5s for double click selections and 0.7s for triple click selections.

You can modify setting the options `@tcc_timeout` (for double click) and `@tcc_long_timeout` (for triple click) before loading it:
``` shell
set -g @tcc_timeout 0.5 # wait 0.5 seconds on double click to check if the selection changed
set -g @tcc_long_timeout 3 # wait 3 seconds on triple click to check if the selection changed
set -g @tcc_copy_command "copy-pipe-no-clear" # change copy command
set -g @plugin "aless3/tmux-click-copy"
```

This plugin automatically binds `DoubleClick1Pane` and `TripleClick1Pane` in the root and copy-mode key-tables, to disable auto-binding set `@tcc_autobind` to false:
``` shell
set -g @tcc_autobind false
set -g @plugin "aless3/tmux-click-copy"
```

The shell script command used internally is stored also in the global options `@TCC_COMMAND` and `@TCC_COMMAND_TRIPLE`, so you can bind it how you want.

# tmux_click_copy

This plugin rebind DoubleClick1Pane and TripleClick1Pane in the root and copy-mode key-tables with the default (when mouse on) with the addition to not stop the selection upon releasing the mouse and starting an async timer of 1.5 seconds to stop the selection and exit copy mode if it remains unaltered after the timer ends.

This enables to drag to extend the selection with double or triple click with the 'word-selection' and 'line-selection', but also does not leave the pane in copy mode if using just a double (or triple) click to select just the word or the line without dragging the mouse

Double & Triple click taken and modified from [ideasman dotfiles](https://gitlab.com/ideasman42/dotfiles) with the addition of a bash script that after a timeout exits copy-mode if the selection has not changed

# Usage
Install this plugin via the [tmux plugin manager](https://github.com/tmux-plugins/tpm) adding this to your tmux configuration file:
``` shell
set -g @plugin "aless3/tmux-click-copy"
```
Send `prefix+I` to fetch and install the plugin and source it.
The default timeout after which this plugin copies the selection and exits copy mode is 1.5s.
You can modify setting the option @tcc_timeout before loading it like:
``` shell
set -g @tcc_timeout 10
set -g @plugin "aless3/tmux-click-copy"
```

The shell script command used internally is stored also in the option @TCC_COMMAND, you can bind it at the end of your binding to further customize the behavior of this plugin.


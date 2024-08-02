#!/usr/bin/env bash

pane_id=$1

selection_start_x=$2
selection_start_y=$3

selection_end_x=$4
selection_end_y=$5

sleep_duration=$6

sleep $sleep_duration

# this is a multi #{&&:X,Y} expression because else the 'and-ing'
# considers only the initial two values, so I split the four condition
# into two different #{&&:X,Y} expressions and run the and between those two
# each of the four inner expression, this is simply a check if the selection boundary
# is the same this script received as input or changed (once for start(x|y) and end(x|y)).
# Then if all the boundaries are the same and @tcc_down is true (checking the mouse is
# still down), copy the selection and cancel copy-mode in the pane that triggered this script

start_x="#{==:#{selection_start_x},${selection_start_x}}"
start_y="#{==:#{selection_start_y},${selection_start_y}}"
start_and="#{&&:${start_x},${start_y}}"

end_x="#{==:#{selection_end_x},${selection_end_x}}"
end_y="#{==:#{selection_end_y},${selection_end_y}}"
end_and="#{&&:${end_x},${end_y}}"

same_rect="#{&&:${start_and},${end_and}}"
rect_tcc_down="#{&&:${same_rect},#{@tcc_down}}"

# run the expression in tmux
tmux if -F "${rect_tcc_down}" "send -X -t ${pane_id} copy-selection-and-cancel ; set-option -p -t ${pane_id} @tcc_down 0"

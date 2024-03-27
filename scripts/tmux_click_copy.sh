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
# each of the four inner expression is simply a check if the selection boundary
# is the same this script received as input or changed (once for start(x|y) and end(x|y)).
# Then if all the boundaries are the same, `copy-mode -q -t ${pane_id}` send an
# 'exit copy-mode' (copy-mode -q) to the pane that triggered this script
tmux if -F "#{&&:#{&&:#{==:#{selection_start_x},${selection_start_x}},#{==:#{selection_start_y},${selection_start_y}}},#{&&:#{==:#{selection_end_x},${selection_end_x}},#{==:#{selection_end_y},${selection_end_y}}}}" "copy-mode -q -t ${pane_id}"

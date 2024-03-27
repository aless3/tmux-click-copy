#!/usr/bin/env bash

pane_id=$1

selection_start_x=$2
selection_start_y=$3

selection_end_x=$4
selection_end_y=$5

sleep 1.5

tmux if -F "#{&&:#{&&:#{==:#{selection_start_x},${selection_start_x}},#{==:#{selection_start_y},${selection_start_y}}},#{&&:#{==:#{selection_end_x},${selection_end_x}},#{==:#{selection_end_y},${selection_end_y}}}}" "copy-mode -q -t ${pane_id}"
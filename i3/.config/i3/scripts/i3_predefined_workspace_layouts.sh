#!/bin/bash

desktop=^sull
laptop=^kel
terminal=termite
browser=firefox
layout1="/home/jko/.config/i3/layouts/default-terminal-split.json"

if [[ ! $HOSTNAME =~ desktop && ! $HOSTNAME =~ laptop ]]; then
  browser=google-chrome
fi

# load common layouts into numbered workspaces
for n in 1 2 7; do
  i3-msg "workspace $n:trm; append_layout ${layout1}"
done

# open clients to be initially 'captured' by pre-defined layouts
for n in $(seq 6); do
  i3-msg "exec ${terminal}"
done

# open clients to be 'captured' by scratchpad
i3-msg "exec ${terminal} --title=scratchterm"

# open client instances in specified workspaces
i3-msg "workspace 8:com; exec ${browser} https://mail.google.com"

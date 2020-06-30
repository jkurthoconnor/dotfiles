#!/bin/bash

desktop=^sull
laptop=^kel
browser=firefox
terminal=termite

if [[ $HOSTNAME =~ $desktop ]]; then
  terminal=alacritty
fi

if [[ ! $HOSTNAME =~ $desktop && ! $HOSTNAME =~ $laptop ]]; then
  browser=google-chrome
fi

# open client instances in specified workspaces
i3-msg "workspace 8:com; exec ${browser} https://mail.google.com"
i3-msg "workspace 0:trm; exec ${terminal}"

# open clients to be 'captured' by scratchpad
i3-msg "exec ${terminal} --title=scratchterm"


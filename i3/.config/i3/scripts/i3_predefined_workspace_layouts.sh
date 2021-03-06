#!/bin/bash

desktop=^sull
laptop=^kel
browser=firefox
terminal=alacritty

if [[ ! $HOSTNAME =~ $desktop && ! $HOSTNAME =~ $laptop ]]; then
  browser=google-chrome
  terminal=termite
fi

# open client instances in specified workspaces
i3-msg "workspace 8:com; exec ${browser} https://mail.google.com"
i3-msg "workspace 0:trm; exec ${terminal}"

# open clients to be 'captured' by scratchpad
i3-msg "exec ${terminal} --title=scratchterm"


#!/bin/bash

device=$HOSTNAME
desktop=sullilly
laptop=kell

if [ $device = $desktop ]; then
  # load pre-defined layouts
  i3-msg "workspace 4. code; append_layout /home/jko/.config/i3/layouts/ws4.json"
  i3-msg "workspace 10. misc; append_layout /home/jko/.config/i3/layouts/ws0.json"
  # open client instance assigned to workspace
  i3-msg "workspace 8. comm; exec firefox https://mail.google.com"
  # open client assigned to scratchpad
  i3-msg "exec --no-startup-id keepassxc"
  # open clients initially assigned to pre-defined layouts
  i3-msg "exec termite"
  i3-msg "exec termite"
  i3-msg "exec termite --name=cmus_container --title=cmus -e cmus"
  i3-msg "exec termite"
  i3-msg "exec termite"
elif [ $device = $laptop ]; then
  i3-msg "exec termite"
  i3-msg "exec termite"
fi

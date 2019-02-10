#!/bin/bash

device=$HOSTNAME
desktop=sullilly
laptop=kell

if [ $device = $desktop ]; then
  # load pre-defined layouts
  i3-msg "workspace 4 cde; append_layout /home/jko/.config/i3/layouts/ws4.json"
  i3-msg "workspace 0 etc; append_layout /home/jko/.config/i3/layouts/ws0.json"
  # open client instance assigned to workspace
  i3-msg "workspace 8 com; exec firefox https://mail.google.com"
  # open client assigned to scratchpad
  i3-msg "exec --no-startup-id keepassxc"
  # open clients initially assigned to pre-defined layouts
  i3-msg "exec termite"
  i3-msg "exec termite"
  i3-msg "exec termite --name=cmus_container --title=cmus -e cmus"
  i3-msg "exec termite"
  i3-msg "exec termite"
elif [ $device = $laptop ]; then
  # open client instance assigned to workspace
  i3-msg "workspace 8 com; exec firefox https://mail.google.com"
  # load pre-defined layout
  i3-msg "workspace 4 cde; append_layout /home/jko/.config/i3/layouts/ws4.json"
  # open clients initially assigned to pre-defined layout
  i3-msg "exec termite"
  i3-msg "exec termite"
fi

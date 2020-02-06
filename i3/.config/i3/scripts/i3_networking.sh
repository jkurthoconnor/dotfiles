#!/bin/bash

desktop=^sull
laptop=^kel

if [[ $HOSTNAME =~ $desktop ]]; then
  i3-msg "exec --no-startup-id nm-applet"
elif [[ $HOSTNAME =~ $laptop ]]; then
  i3-msg "exec --no-startup-id wicd-client --tray"
fi

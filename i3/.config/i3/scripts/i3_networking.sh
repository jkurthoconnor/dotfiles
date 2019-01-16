#!/bin/bash

device=$HOSTNAME
desktop=sullilly
laptop=kell

if [ $device = $desktop ]; then
  i3-msg "exec --no-startup-id nm-applet"
elif [ $device = $laptop ]; then
  i3-msg "exec --no-startup-id wicd-client --tray"
fi

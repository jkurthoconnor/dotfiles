#!/bin/bash

device=$HOSTNAME
desktop=sullilly
laptop=kell

if [ $device == $desktop ]; then
  xrandr --output DP-0 --mode 1920x1200 --pos 1920x0 --rotate left --output DVI-D-0 --off --output DP-1 --off --output HDMI-0 --primary --mode 1920x1200 --pos 0x328 --rotate normal
elif [ $device == $laptop ]; then
  system76-power graphics | grep -q 'nvidia'
  if [ $? -eq 0 ]; then
    xrandr --output eDP-1-1 --auto --pos 0x0 --primary --output DVI-I-2-1 --auto --pos 1920x0 --right-of eDP-1-1 --rotate left
  fi
fi

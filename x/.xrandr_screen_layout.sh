#!/bin/bash
# executed  by .xinitrc (for getty login) and sourced in i3_Xsettings_for_dm_boot.sh
# When called directly and device is $desktop, passing in first argument as anything but
# 'landscape' will set the left monitor to portrait mode

device=$HOSTNAME
desktop=^su
laptop=^ke
left_orientation=${1:-'landscape'}

echo $left_orientation
if [[ $device =~ $desktop ]]; then
  # landscape | portrait
  if [ $left_orientation == 'landscape' ]; then
    xrandr --output DP-1 --mode 1920x1200 --pos 1920x0 --rotate right --output DVI-D-1 --off --output HDMI-1 --primary --mode 1920x1200 --pos 0x328 --rotate normal
  # portrait | portrait
  else
    xrandr --output DP-1 --mode 1920x1200 --pos 1200x0 --rotate right --output DVI-D-1 --off --output HDMI-1 --primary --mode 1920x1200 --pos 0x0 --rotate left
  fi
elif [[ $device =~ $laptop ]]; then
  system76-power graphics | grep -q 'nvidia'
  if [ $? -eq 0 ]; then
    xrandr --output eDP-1-1 --auto --pos 0x0 --primary --output DVI-I-2-1 --auto --pos 1920x0 --right-of eDP-1-1 --rotate left
  fi
else
  xrandr --output DP-0  --mode 1920x1080 --pos 1920x0 --right-of DP-2 --rotate left --output DP-1 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off --output DP-6 --off --output DP-2 --primary --mode 1920x1080 --pos 0x900 --rotate normal
fi

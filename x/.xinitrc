#!/bin/bash

# `.xinitrc` is bypassed when Xserver is started by a display manager

systemctl --user import-environment DISPLAY

system76-power graphics | grep -q 'nvidia'

if [ $? -eq 0 ]; then
  xrandr --setprovideroutputsource modesetting NVIDIA-0
   xrandr --auto
   xrandr --dpi 96
fi

$HOME/.xrandr_screen_layout.sh
xsetroot -solid "#0f0f0f"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# if an ErgoDox is not in input list, confirm existence of & source `.Xmodmap`
[[ ! $(xinput list | grep 'ErgoDox') ]] && [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec i3

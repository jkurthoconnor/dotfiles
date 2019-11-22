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

# if neither an ErgoDox nor Iris is in input list, confirm existence of & source `._Xmodmap`
# '_' namespacing is used to prevent the file '.Xmodmap' from being read automatically when i3 is executed by a display manager
[[ ! $(xinput list | grep 'ErgoDox') ]] && \
[[ ! $(xinput list | grep 'Keebio Iris') ]] && \
[[ -f ~/._Xmodmap ]] && xmodmap ~/._Xmodmap

exec i3

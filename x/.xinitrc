#!/bin/bash
systemctl --user import-environment DISPLAY

$HOME/.config/i3/scripts/i3_xrandr_screen_layout.sh
xsetroot -solid "#0f0f0f"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# if an ErgoDox keyboard is not in the input list, confirm existence of and
# source `.Xmodmap`
[[ $(xinput list | grep 'ErgoDox') ]] || [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec i3

#!/bin/bash

# `.xinitrc` is bypassed when Xserver is started by a display manager

systemctl --user import-environment DISPLAY

$HOME/.xrandr_screen_layout.sh
xsetroot -solid "#0f0f0f"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# if an ErgoDox is not in input list, confirm existence of & source `.Xmodmap`
[[ ! $(xinput list | grep 'ErgoDox') ]] && [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec i3

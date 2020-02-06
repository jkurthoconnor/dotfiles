#!/bin/bash

# `.xinitrc` is bypassed when Xserver is started by a display manager
# so this script ensures proper settings for display manager X starts by
# excluding non-dm boxes

desktop=^sull
laptop=^kel

[[ $HOSTNAME =~ $desktop || $HOSTNAME =~ $laptop ]] && exit 0

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
source $HOME/.xrandr_screen_layout.sh
xsetroot -solid "#0f0f0f"

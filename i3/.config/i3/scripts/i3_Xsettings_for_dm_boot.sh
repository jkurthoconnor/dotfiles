#!/bin/bash

# `.xinitrc` is bypassed when Xserver is started by a display manager
# This script ensures proper settings for dm X starts
# TODO: Xresources are available only after i3 draws the screen, so some colors require a config reload to display; call script earlier for dm target boots

desktop=^sull
laptop=^kel

# exit early for non-dm boot devices (.xinitrc will have already run)
[[ $HOSTNAME =~ $desktop || $HOSTNAME =~ $laptop ]] && exit 0

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
source $HOME/.xrandr_screen_layout.sh
xsetroot -solid "#0f0f0f"

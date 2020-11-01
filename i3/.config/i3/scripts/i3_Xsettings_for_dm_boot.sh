#!/bin/bash

# `.xinitrc` is bypassed when Xserver is started by a display manager
# This script ensures proper x settings for dm triggered X starts
# TODO: this script is called in the i3 start up, thus Xresources are being made available
# only after i3 draws the screen; but i3 config assigns some colors from Xresources.
# Thus some colors require a config reload to display; call script earlier for dm target boots

desktop=^sull
laptop=^kel

# exit early for non-dm boot devices (.xinitrc will have already run)
# TODO: determine if .xinitrc has already been called; do not rely on $HOSTNAME 
[[ $HOSTNAME =~ $desktop || $HOSTNAME =~ $laptop ]] && exit 0

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
source $HOME/.xrandr_screen_layout.sh
xsetroot -solid "#0f0f0f"

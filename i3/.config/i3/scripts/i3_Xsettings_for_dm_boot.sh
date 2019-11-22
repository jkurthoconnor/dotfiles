#!/bin/bash

# `.xinitrc` is bypassed when Xserver is started by a display manager
# so this script ensures proper settings for display manager X starts


if [[ $HOSTNAME =~ 'ocon' ]]; then

  [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
  source $HOME/.xrandr_screen_layout.sh
  xsetroot -solid "#0f0f0f"

fi

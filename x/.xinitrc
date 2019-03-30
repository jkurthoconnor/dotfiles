#!/bin/bash
systemctl --user import-environment DISPLAY

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

if [ $HOSTNAME = kell ]; then
  [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
fi

exec i3

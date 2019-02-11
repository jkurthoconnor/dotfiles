#!/bin/bash
systemctl --user import-environment DISPLAY

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec i3

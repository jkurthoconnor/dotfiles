#!/usr/bin/env bash

# `chown` scrip to root; run with `sudo`
# Add local sudoers file to `/etc/sudoers.d/` to bypass password
# see `man sudoers` for format

SETTINGS=/sys/class/backlight/intel_backlight/brightness
MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)
MIN=1000

urgency=normal
current=$(cat "$SETTINGS")
new="$current"

if [ "$1" = "-inc" ]; then
  new=$["$current" + 2000]
elif [ "$1" = "-dec" ]; then
  new=$["$current" - 2000]
else
  exit 1
fi

if [ "$new" -lt "$MAX" ] && [ "$new" -ge "$MIN" ]; then
  echo "$new" > "$SETTINGS"
fi

percent=$(echo "scale=2; $new / $MAX * 100" | bc)

if [  $(echo "$percent > 85" | bc) -eq 1 ]; then
  urgency=critical
fi

notify-send -u "$urgency" -t 250 "Screen Brightness: $percent %"
exit 0

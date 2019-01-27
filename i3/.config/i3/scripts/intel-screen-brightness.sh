#!/usr/bin/env bash

# chown root for this script
# run script with `sudo` to write brightness setting
# may need to modify sudoers (`sudo visudo`) & include arguments in script call

SETTINGS=/sys/class/backlight/intel_backlight/brightness
MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)
MIN=1000

current=$(cat "$SETTINGS")
new="$current"

if [ "$1" = "-inc" ]; then
  new=$["$current" + 2000]
elif [ "$1" = "-dec" ]; then
  new=$["$current" - 2000]
else
  exit 1
fi

if [ "$new" -le "$MAX" ] && [ "$new" -ge "$MIN" ]; then
  echo "$new" > "$SETTINGS"
  exit 0
fi

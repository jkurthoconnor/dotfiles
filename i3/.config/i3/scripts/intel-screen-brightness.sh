#!/usr/bin/env bash

MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)
MIN=1000

current=$(cat /sys/class/backlight/intel_backlight/brightness)
new="$current"

if [ "$1" = "-inc" ]; then
  new=$[$current + 2000]
elif [ "$1" = "-dec" ]; then
  new=$[$current - 2000]
fi

if [ "$new" -le "$MAX" ] && [ "$new" -ge "$MIN" ]; then
  echo $new > /sys/class/backlight/intel_backlight/brightness
fi

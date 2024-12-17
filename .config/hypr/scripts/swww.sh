#!/bin/bash

if ! pgrep -x "swww-daemon" >/dev/null; then
  swww-daemon
  sleep 1
fi
WALLPAPER_PATH="~/.wallpapers/wallpaper.gif"
swww img "$WALLPAPER_PATH" --transition-type center --transition-fps 60 --transition-duration 1

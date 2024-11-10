#!/bin/bash

if ! pgrep -x "swww" >/dev/null; then
  echo "Starting swww daemon..."
  swww-daemon
  sleep 1
fi
WALLPAPER_PATH="~/.wallpapers/wallpaper.gif"
swww clear-cache
swww img "$WALLPAPER_PATH" --transition-type center --transition-fps 60 --transition-duration 1

echo "Wallpaper set to $WALLPAPER_PATH"

#!/bin/bash

if ! pgrep -x "swww-daemon" >/dev/null; then
  echo "Starting swww daemon..."
  swww-daemon
  sleep 1
fi
WALLPAPER_PATH="~/.wallpapers/wallpaper.gif"
echo $WALLPAPER_PATH
swww img "$WALLPAPER_PATH" --transition-type center --transition-fps 60 --transition-duration 1

echo "Wallpaper set to $WALLPAPER_PATH"

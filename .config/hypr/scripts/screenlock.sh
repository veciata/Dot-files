#!/usr/bin/env bash

timeswaylock=60
timeoff=100
crtbrtnes=$CURRENT_BRIGHTNESS
swayidle \
	timeout $timeswaylock 'sleep 1 && wallock -o lock' \
	timeout 45 "CURRENT_BRIGHTNESS=$(brightnessctl get); brightnessctl set $(($CURRENT_BRIGHTNESS / 2))" \
	timeout $timeoff 'hyprctl dispatch dpms off' \
	resume "hyprctl dispatch dpms on & brightnessctl set $crtbrtnes

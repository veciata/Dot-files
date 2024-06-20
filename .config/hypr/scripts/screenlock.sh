#!/usr/bin/env bash
timebrt=30
timelock=60
timeoff=100
crtbrtnes="brightnessctl get"
swayidle \
	timeout $timelock 'wallock -o lock' \
	timeout $timebrt "brightnessctl set $crtbrtnes/2" \
	timeout $timeoff 'hyprctl dispatch dpms off' \
	resume "hyprctl dispatch dpms on & brightnessctl set $crtbrtnes"

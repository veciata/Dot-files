#!/usr/bin/env bash

timeswaylock=60
timeoff=100

swayidle \
	timeout $timeswaylock 'sleep 1 && swaylock' \
	timeout 90 "CURRENT_BRIGHTNESS=$(brightnessctl get); brightnessctl set $(($CURRENT_BRIGHTNESS / 2))" \
	timeout $timeoff 'hyprctl dispatch dpms off' \
	resume "hyprctl dispatch dpms on & brightnessctl set $CURRENT_BRIGHTNESS"

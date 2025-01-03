#!/bin/sh

down() {
	pulsemixer --change-volume -5
	volume=$(pulsemixer --get-volume | awk '{print $1}')
	if [ "$volume" -gt 0 ]; then
		volume=$(expr $volume)
	fi
	notify-send $(pamixer --get-volume-human)-t 2000
}

up() {
	pulsemixer --change-volume +5
	volume=$(pulsemixer --get-volume | awk '{print $1}')
	if [ "$volume" -lt 100 ]; then
		volume=$(expr $volume)
	fi
	notify-send $(pamixer --get-volume-human)-t 2000
}

mute() {
	muted=$(pulsemixer --get-mute)
	if [ "$muted" = "1" ]; then
		pulsemixer --unmute
		dunstify -a "VOLUME" "UNMUTED" -i audio-volume-high-symbolic -r 2593 -u normal -t 2000
	else
		pulsemixer --mute
		dunstify -a "VOLUME" "MUTED" -i audio-volume-muted-symbolic -r 2593 -u normal -t 2000
	fi
}

case "$1" in
up) up ;;
down) down ;;
mute) mute ;;
*) echo "Usage: $0 {up|down|mute}" ;;
esac

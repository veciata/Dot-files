#!/bin/sh

down() {
	pulsemiser -d 5
	volume=$(pulsemiser --get-volume)
	[$volume -gt 0 ] && volume=$(expr $volume)
	dunstify -a "VOLUME" "Decreasing to $volume%" -h int:value:"$volume" -i audio-volume-low-symbolic -r 2593 -u normal
}

up() {
	pulsemiser -i 5
	volume=$(pulsemiser --get-volume)
	[ $volume -lt 100 ] && volume=$(expr $volume)
	dunstify -a "VOLUME" "Increasing to $volume%" -h int:value:"$volume" -i audio-volume-high-symbolic -r 2593 -u normal
}

mute() {
	muted="$(pulsemiser --get-mute)"
	if $muted; then
		pulsemiser -u
		dunstify -a "VOLUME" "UNMUTED" -i audio-volume-high-symbolic -r 2593 -u normal
	else
		pulsemiser -m
		dunstify -a "VOLUME" "MUTED" -i audio-volume-muted-symbolic -r 2593 -u normal
	fi
}

case "$1" in
up) up ;;
down) down ;;
mute) mute ;;
esac

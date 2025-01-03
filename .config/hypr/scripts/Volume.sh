#!/bin/bash

# Adjust volume
case "$1" in
up)
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')
    if [ "$volume" -lt 150 ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')
        dunstify \
            -h int:value:"$volume" \
            -i audio-volume-high-symbolic \
            -r 2593 \
            -u normal \
            "Volume" "Current Volume: $volume%"
    else
        dunstify \
            -h int:value:"150" \
            -i audio-volume-high-symbolic \
            -r 2593 \
            -u normal \
            "Volume" "Already at Maximum (150%)"
    fi
    ;;
down)
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')
    dunstify \
        -h int:value:"$volume" \
        -i audio-volume-low-symbolic \
        -r 2593 \
        -u normal \
        "Volume" "Current Volume: $volume%"
    ;;
mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    if pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"; then
        dunstify \
            -h string:x-dunst-stack-tag:volume \
            -i audio-volume-muted-symbolic \
            -r 2593 \
            -u normal \
            "Volume Muted" "Volume is muted"
    else
        volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')
        dunstify \
            -h int:value:"$volume" \
            -i audio-volume-high-symbolic \
            -r 2593 \
            -u normal \
            "Volume" "Current Volume: $volume%"
    fi
    ;;
*)
    echo "Usage: $0 {up|down|mute}"
    exit 1
    ;;
esac

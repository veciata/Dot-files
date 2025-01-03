#!/bin/sh

# Function to decrease brightness
down() {
    pkexec brillo -u 150000 -U 5
    brightness=$(brightnessctl | grep -oP '\(\K[0-9]+(?=%\))')
    dunstify -a "BRIGHTNESS" "Brightness: $brightness%" \
        -h int:value:"$brightness" \
        -i display-brightness-symbolic \
        -r 2593 \
        -u normal
}

# Function to increase brightness
up() {
    pkexec brillo -u 150000 -A 5
    brightness=$(brightnessctl | grep -oP '\(\K[0-9]+(?=%\))')
    dunstify -a "BRIGHTNESS" "Brightness: $brightness%" \
        -h int:value:"$brightness" \
        -i display-brightness-symbolic \
        -r 2593 \
        -u normal
}

# Main case statement to handle input argument
case "$1" in
up) up ;;
down) down ;;
esac

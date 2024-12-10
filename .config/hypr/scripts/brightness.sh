#!/bin/sh

down() {
  pkexec brillo -u 150000 -U 5
  brightness=$(brightnessctl)
  dunstify -a "BRIGHTNESS" "Decreasing to $brightness%" -h int:value:"$brightness" -i display-brightness-symbolic -r 2593 -u normal
}

up() {
  pkexec brillo -u 150000 -A 5
  brightness=$(light -g)
  dunstify -a "BRIGHTNESS" "Increasing to $brightness%" -h int:value:"$brightness" -i display-brightness-symbolic -r 2593 -u normal
}

case "$1" in
up) up ;;
down) down ;;
esac

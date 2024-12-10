#!/bin/bash

# Adjust volume
case "$1" in
up)
  pamixer --increase 5
  ;;
down)
  pamixer --decrease 5
  ;;
mute)
  pamixer --toggle-mute
  ;;
*)
  echo "Usage: $0 {up|down|mute}"
  exit 1
  ;;
esac

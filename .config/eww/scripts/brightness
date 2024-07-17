#!/bin/bash

# You can call this script like this:
# brightnessControl up
# brightnessControl down

# Script inspired by these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_brightness_num() {
  cur_brightness=$(brightnessctl g)
  max_brightness=$(brightnessctl m)
  brightness_level=$(expr $max_brightness - $cur_brightness)
  if [[ "$brightness_level" == 0 ]]
  then
      brightness="100"
  else
      brightness=$(awk "BEGIN {print $max_brightness / $cur_brightness}")
      brightness=$(awk "BEGIN {print 100 / $brightness}")
#       echo "$brightness"
  fi
  echo $brightness
}

function send_notification {
  icon=/usr/share/icons/Papirus-Dark/16x16/actions/brightnesssettings.svg
  brightness=$(get_brightness_num)
  notify-send -i "" -r 5555 -u normal "$bar $brightness"
}

case $1 in
  up)
    # increase the backlight by 5%
    brightnessctl s +1
    send_notification
    canberra-gtk-play -i audio-volume-change
    ;;
  down)
    # decrease the backlight by 5%
    brightnessctl s 1-
    send_notification
    canberra-gtk-play -i audio-volume-change
    ;;
  *)
    brightness=$(get_brightness_num)
    brightness=$(echo "$brightness" | awk '{print ($0-int($0)<0.499)?int($0):int($0)+1}')
    printf "%s" "$brightness" "%"
    ;;
esac

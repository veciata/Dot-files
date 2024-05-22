
#!/usr/bin/env bash

timeswaylock=60
timeoff=100


# Build the swayidle command with joystick check
swayidle \
    timeout $timeswaylock 'sleep 1 && swaylock' \
    timeout $timeoff 'hyprctl dispatch dpms off' \
    resume 'hyprctl dispatch dpms on' 

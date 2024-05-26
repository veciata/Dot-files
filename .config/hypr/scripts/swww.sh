#!/usr/bin/env bash
 # Check swww daemon
swww query
if [ $? -eq 1 ] ; then
    swww init
fi
swww img ~/Videos/Gear-5-Luffy.gif

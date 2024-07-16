#!/bin/bash

# Directory containing your videos
VIDEO_DIR=~/Videos

while true; do
    # Use Rofi to select a video
    SELECTED_VIDEO=$(find "$VIDEO_DIR" -type f -name "*.mp4" | rofi -dmenu -i -p "Select video:")

    # If no video is selected, exit the loop
    if [ -z "$SELECTED_VIDEO" ]; then
        notify-send "No video selected"
        exit 0
    fi

    # Preview the selected video using mpv
    mpv --really-quiet "$SELECTED_VIDEO" &
    MPV_PID=$!

    # Ask for confirmation to set the selected video as wallpaper
    CONFIRM=$(echo -e "Yes\nNo" | rofi -dmenu -i -p "Set this video as wallpaper?")

    if [ "$CONFIRM" == "Yes" ]; then
        # Kill the mpv preview
        kill $MPV_PID

        # Copy the selected video to the wallpaper location
        rm -rf ~/.wallpapers/*
        cp "$SELECTED_VIDEO" ~/.wallpapers/wallpaper.mp4
        # Notify the user
        pkill wallock
        notify-send "Wallpaper set to $SELECTED_VIDEO"
        sleep 0.5 
        wallock
        exit 0
    else
        # Kill the mpv preview if not confirmed
        kill $MPV_PID
        # Wait briefly to ensure mpv is killed before continuing
        sleep 0.1
    fi
done


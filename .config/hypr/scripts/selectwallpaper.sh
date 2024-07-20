#!/bin/bash

# Directory containing your videos
VIDEO_DIR=~/Videos

while true; do
    # Use Rofi to select a video
    SELECTED_VIDEO=$(find "$VIDEO_DIR" -type f -name "*.mp4" -exec basename {} \; | rofi -dmenu -i -p "Select video:")

    # If no video is selected, exit the loop
    if [ -z "$SELECTED_VIDEO" ]; then
        notify-send "No video selected"
        exit 0
    fi

    # Get the full path of the selected video
    FULL_PATH=$(find "$VIDEO_DIR" -type f -name "$SELECTED_VIDEO")

    # Preview the selected video using mpv
    mpv --really-quiet "$FULL_PATH" &
    MPV_PID=$!

    # Ask for confirmation to set the selected video as wallpaper
    CONFIRM=$(echo -e "Yes\nNo" | rofi -dmenu -i -p "Set this video as wallpaper?")

    if [ "$CONFIRM" == "Yes" ]; then
        # Kill the mpv preview
        kill $MPV_PID

        # Copy the selected video to the wallpaper location
        rm -rf ~/.wallpapers/*
        cp "$FULL_PATH" ~/.wallpapers/wallpaper.mp4
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

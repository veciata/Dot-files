#!/bin/bash

# Directory containing your videos
VIDEO_DIR=~/Videos

while true; do
    # Use Rofi to select a video
    SELECTED_VIDEO=$(find "$VIDEO_DIR" -type f -name "*.mp4" -exec basename {} \; | rofi -dmenu -i -p "Select video:")

    # Exit if no video is selected
    [ -z "$SELECTED_VIDEO" ] && {
        notify-send "No video selected"
        exit 0
    }

    # Get the full path of the selected video
    FULL_PATH=$(find "$VIDEO_DIR" -type f -name "$SELECTED_VIDEO" | head -n 1)

    # Preview the selected video using mpv
    mpv --really-quiet "$FULL_PATH" &
    MPV_PID=$!

    # Ask for confirmation to set the selected video as wallpaper
    if echo -e "Yes\nNo" | rofi -dmenu -i -p "Set this video as wallpaper?" | grep -q "Yes"; then
        # Kill the mpv preview
        kill $MPV_PID
        rm -rf ~/.wallpapers/*
        ffmpeg -i $FULL_PATH -vf "select=eq(n\,1)" -vsync vfr ~/.wallpapers/wallpaper.jpg
        cp "$FULL_PATH" ~/.wallpapers/wallpaper.mp4
        ffmpeg -i ~/.wallpapers/wallpaper.mp4 -vf "fps=60,scale=1920:-1:flags=lanczos" -c:v gif -q:v 10 ~/.wallpapers/wallpaper.gif
        ~/.config/hypr/scripts/swww.sh && notify-send "Wallpaper set to $SELECTED_VIDEO"
        exit 0
    else
        kill $MPV_PID
        sleep 0.1
    fi
done

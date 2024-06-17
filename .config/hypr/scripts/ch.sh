#!/bin/bash

# Directory containing your backgrounds
BACKGROUND_DIR=~/Pictures/Wallpaper/

# List the files in the background directory
FILES=($(ls $BACKGROUND_DIR))

# Use rofi to select a background
SELECTED=$(printf "%s\n" "${FILES[@]}" | rofi -dmenu -p "Select Background")

# Check if a file was selected
if [ -n "$SELECTED" ]; then
	# Set the background using feh (or your preferred tool)
	feh --bg-scale "$BACKGROUND_DIR/$SELECTED"
else
	echo "No background selected."
fi

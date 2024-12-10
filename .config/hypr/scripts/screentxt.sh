#!/bin/bash

TEMP_FOLDER="/tmp/screenshot"
TEMP_FILE="screenshot.png"
TEMP_TEXT="/tmp/screenshot/screenshot"

mkdir -p "$TEMP_FOLDER"

hyprshot -m region -o "$TEMP_FOLDER" -f "$TEMP_FILE" -z -t 2000

tesseract "$TEMP_FOLDER/$TEMP_FILE" "$TEMP_TEXT"

if [ $? -eq 0 ]; then
	wl-copy <"$TEMP_TEXT.txt"
	notify-send "Screenshot and text copied to clipboard!" -t 2000
else
	notify-send "Failed to extract text from screenshot." -t 2000
fi

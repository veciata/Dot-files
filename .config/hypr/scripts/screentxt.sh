#!/bin/bash

TEMP_FILE="/tmp/screenshot.png"
TEMP_TEXT="/tmp/screenshot"


grimblast --notify copysave area "$TEMP_FILE" 
tesseract "$TEMP_FILE" "$TEMP_TEXT"
wl-copy < "$TEMP_TEXT.txt"
notify-send "Screenshot and text copied to clipboard!"

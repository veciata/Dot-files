
#!/bin/bash

# Define temporary file location
TEMP_FILE="/tmp/screenshot.png"
TEMP_TEXT="/tmp/screenshot.txt"

# Take a screenshot with grimblast and save it to the temporary file
grimblast save active "$TEMP_FILE"

# Copy the screenshot to clipboard using xclip
xclip -selection clipboard -t image/png -i "$TEMP_FILE"

# Alternatively, you can use xsel to copy to the clipboard
# xsel --clipboard --input --mime-type=image/png < "$TEMP_FILE"

# Extract text from the screenshot using tesseract
tesseract "$TEMP_FILE" "$TEMP_TEXT"

# Read the extracted text
TEXT=$(cat "$TEMP_TEXT.txt")

# Copy the extracted text to the clipboard
echo "$TEXT" | xclip -selection clipboard

# Notify the user
notify-send "Screenshot and text copied to clipboard!"

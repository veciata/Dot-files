
#!/bin/bash

# Path to your wallpaper (video)
WALLPAPER_VIDEO="$HOME/.wallpapers/wallpaper.mp4"

# Path to your Waybar CSS file
WAYBAR_CSS="$HOME/.config/waybar/theme/wallpapercolors.css"

# Extract a frame from the video (change 00:00:01 to the desired timestamp)
ffmpeg -i "$WALLPAPER_VIDEO" -ss 00:00:01 -vframes 1 -q:v 2 /tmp/wallpaper_frame.png -y

# Use pywal to get the colors from the extracted frame
wal -i /tmp/wallpaper_frame.png

# Extract colors from the pywal generated file
colors=($(awk 'NR>=2 && NR<=7 {print $1}' ~/.cache/wal/colors))

# Debug print to check extracted colors
echo "Extracted colors: ${colors[@]}"

# Function to calculate luminance
calculate_luminance() {
  local color="$1"
  # Extract RGB components from hex color string
  r=$((16#${color:1:2}))
  g=$((16#${color:3:2}))
  b=$((16#${color:5:2}))
  # Calculate luminance
  echo "scale=2; ($r*0.299 + $g*0.587 + $b*0.114)" | bc
}

# Sort colors by luminance (darkest to lightest)
sorted_colors=($(for color in "${colors[@]}"; do
  echo "$(calculate_luminance $color) $color"
done | sort -n | awk '{print $2}'))

# Debug print to check sorted colors
echo "Sorted colors: ${sorted_colors[@]}"

# Update Waybar CSS file
{
  echo "@define-color color1 ${sorted_colors[0]};"
  echo "@define-color color2 ${sorted_colors[1]};"
  echo "@define-color color3 ${sorted_colors[2]};"
  echo "@define-color color4 ${sorted_colors[3]};"
  echo "@define-color color5 ${sorted_colors[4]};"
  echo "@define-color color6 ${sorted_colors[5]};"
} > "$WAYBAR_CSS"

echo "Waybar CSS updated with the top 6 colors from your wallpaper."


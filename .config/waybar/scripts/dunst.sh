
#!/bin/bash

# Fetch notification history from Dunst
history=$(dunstctl history | jq -r '.data[] | .summary + ": " + .body')

# Escape double quotes in the history
formatted_history=$(echo "$history" | tr '\n' ' ' | sed 's/"/\\"/g')

# Print the formatted history as a JSON object
echo "{\"text\": \"$formatted_history\", \"tooltip\": \"$formatted_history\"}"


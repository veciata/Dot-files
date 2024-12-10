#!/bin/bash

# Get the notification history in JSON format
json_history=$(dunstctl history)

# Use jq to parse and get the last 5 notifications
last_five_notifications=$(echo "$json_history" | jq '.[-5:] | reverse | .[] | .summary')

# Format the output as a single string with newline characters
formatted_notifications=$(echo "$last_five_notifications" | jq -r '. + "\n"')

# Display the notifications
echo -e "$formatted_notifications"

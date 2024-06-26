#!/usr/bin/env bash


# Prompt the user for input using Rofi
input=$(rofi -dmenu -p "Enter CLI Input:")

# Check if the user provided input
if [ -n "$input" ]; then
    # Replace the following line with the actual command you want to run, using $input
    result=$(tgpt "$input")

    # Launch kitty and display the result
    kitty -e sh -c "echo \"$result\"; read -p \"Press Enter to close...\""
else
    # If no input provided, show a message
    rofi -e "No input provided."
fi


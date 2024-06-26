
#!/bin/bash

while true; do
    # Fetch prayer times using prayer-times command
    prayer_times=$(prayer-times --latitude 40.204630614045044 --longitude 31.29041 --madhab Hanafi)

    # Extract the next prayer time
    next_prayer_time=$(echo "$prayer_times" | grep -oP 'Adhan \K.*')

    if [ -z "$next_prayer_time" ]; then
        echo "No prayer times found."
        sleep 60
        continue
    fi

    # Convert next prayer time to seconds since epoch
    next_prayer_epoch=$(date -d "$next_prayer_time" +%s)

    # Get current time in seconds since epoch
    current_time_epoch=$(date +%s)

    # Calculate remaining time until next prayer
    remaining_time=$((next_prayer_epoch - current_time_epoch))

    if [ $remaining_time -gt 0 ]; then
        printf "%02d:%02d:%02d\n" $((remaining_time / 3600)) $((remaining_time % 3600 / 60)) $((remaining_time % 60))
        sleep 60
    else
        sleep 1
    fi
done


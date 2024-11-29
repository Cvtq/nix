#!/bin/bash

# Handle left-click to display notifications in a dmenu-like menu with anyrun
if [[ "$1" == "show" ]]; then
    # Retrieve and parse the list of notifications, displaying app name and summary
    notifications=$(makoctl list | jq -r '.data[0][] | .["app-name"].data + ": " + .summary.data')

    # If there are notifications, display them using anyrun with libstdin.so
    if [ -n "$notifications" ]; then
        echo "$notifications" | anyrun --plugins libstdin.so
    else
        notify-send -u low"No notifications"  # Show a message if there are no notifications
    fi
    exit 0
fi

# Handle right-click to toggle between modes
if [[ "$1" == "toggle" ]]; then
    current_mode=$(makoctl mode)  # Retrieve the current mode from makoctl

    if [[ "$current_mode" == "do-not-disturb" ]]; then
        makoctl set-mode default  # Switch to Default mode
    else
        makoctl set-mode do-not-disturb  # Switch to Do Not Disturb mode
    fi
    exit 0
fi

# Count notifications by parsing the JSON structure
missed_count=$(makoctl list | jq '.data[0] | length')

# Get the current mode (either "default" or "do-not-disturb")
current_mode=$(makoctl mode)

# Choose the icon based on the mode
if [[ "$current_mode" == "do-not-disturb" ]]; then
    mode_icon=""  # Icon for Do Not Disturb
else
    mode_icon=""  # Icon for Default mode
fi

if [[ "$missed_count" == 0 ]]; then
    echo "$mode_icon"
else
    # Output missed notifications count and mode icon
    echo "$missed_count $mode_icon"
fi

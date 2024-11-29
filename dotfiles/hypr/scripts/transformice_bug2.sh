#!/bin/bash

# Get the class of the currently focused window
FOCUSED_WINDOW_CLASS=$(hyprctl activewindow -j | jq -r '.class')

# Define the class name of the window you want to target
TARGET_CLASS="steam_proton"

# Check if the focused window matches the target
if [[ "$FOCUSED_WINDOW_CLASS" == "$TARGET_CLASS" ]]; then
    # Get the process ID of the focused window
    PID=$(hyprctl activewindow -j | jq -r '.pid')

    # Check if the PID was found
    if [[ -z "$PID" ]]; then
        echo "Transformice is not running."
        exit 1
    fi

    # Check the current state of the process
    STATUS=$(ps -o state= -p $PID)

    if [[ "$STATUS" == "T" ]]; then
        # Process is stopped, so resume it
        kill -CONT $PID
        #notify-send "$TARGET_CLASS resumed"
    else
        # Process is running, so stop it
        kill -STOP $PID
        #notify-send "$TARGET_CLASS paused"
    fi
else
    notify-send "Focused window is not $TARGET_CLASS"
fi

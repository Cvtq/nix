#!/bin/bash

last_clipboard=""

while true; do
    # Get the current clipboard content using wl-paste
    current_clipboard=$(wl-paste -n)

    # Check if the current clipboard content is different from the last recorded content
    if [ "$current_clipboard" != "$last_clipboard" ]; then
        # Update the clipboard using xclip
        echo "$current_clipboard" | xclip -selection clipboard -i

        # Verify the content with xclip and then re-copy using wl-copy
        xclip_content=$(xclip -selection clipboard -o)
        echo "$xclip_content" | wl-copy

        # Update the last_clipboard variable to the current content
        last_clipboard="$current_clipboard"
    fi

    # Sleep for 0.5 seconds before the next check
    sleep 0.5
done

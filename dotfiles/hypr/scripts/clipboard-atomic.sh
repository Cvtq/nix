#!/bin/bash

while true; do
    wl-paste | xclip -selection clipboard
    xclip -selection clipboard -o | wl-copy
    sleep 1
done

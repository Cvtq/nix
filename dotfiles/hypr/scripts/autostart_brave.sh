#!/bin/bash

# Associative array for profiles and workspaces
declare -A profiles_workspaces=(
    ["Profile 2"]="2" # Trading
    ["Profile 10"]="3" # Twitter
    ["Profile 11"]="7" # Crypto
    ["Profile 13"]="5" # News
)

# Function to move a window to a specific workspace
move_to_workspace() {
    local profile=$1
    local workspace=$2
    brave  --password-store=kwallet5 --ozone-platform-hint=wayland --profile-directory="$profile" &
    local pid=$!
    sleep 2
    hyprctl dispatch movetoworkspacesilent "$workspace" $(xdotool search --pid $pid | head -n 1)
}

# Loop through the profiles and workspaces
for profile in "${!profiles_workspaces[@]}"; do
    workspace=${profiles_workspaces[$profile]}
    move_to_workspace "$profile" "$workspace"
done

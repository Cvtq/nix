#!/bin/bash

# Function to display menu
show_menu() {
    echo "Select an option:"
    echo "1. Partition disk with 'disko'."
    echo "2. Run 'nixos-rebuild'."
    echo "3. Run 'home-manager'."
    echo "4. Exit."
}

# Function to confirm and run a command
confirm_and_run() {
    local command="$1"
    echo "You are about to run:"
    echo "$command"
    read -p "Do you want to proceed? (y/n): " confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        echo "Running command..."
        eval "$command"
    else
        echo "Command canceled."
    fi
}

# Function for double confirmation
double_confirm_and_run() {
    local command="$1"
    local disclaimer="$2"

    if [[ -n "$disclaimer" ]]; then
        echo "WARNING: $disclaimer"
    fi

    echo "You are about to run:"
    echo "$command"
    read -p "Are you absolutely sure? (y/n): " first_confirm
    if [[ "$first_confirm" == "y" || "$first_confirm" == "Y" ]]; then
        read -p "This is your final confirmation. Do you want to proceed? (y/n): " second_confirm
        if [[ "$second_confirm" == "y" || "$second_confirm" == "Y" ]]; then
            echo "Running command..."
            eval "$command"
        else
            echo "Command canceled at final confirmation."
        fi
    else
        echo "Command canceled at initial confirmation."
    fi
}

# Main loop
while true; do
    show_menu
    read -p "Enter your choice: " choice

    case $choice in
        1)
            command="nix --experimental-features \"nix-command flakes\" run github:nix-community/disko/latest -- --mode disko disko.nix"
			disclaimer="The 'disko' command modifies disk partitions and could result in data loss."
            double_confirm_and_run "$command" "$disclaimer"
            ;;
        2)
            command="nixos-rebuild switch --flake ."
            confirm_and_run "$command"
            ;;
        3)
            command="home-manager switch --flake ."
            confirm_and_run "$command"
            ;;
        4)
            echo "Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done

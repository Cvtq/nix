#!/bin/bash

# Paths
REPO_DIR=$(pwd)   # Assume the script is run from the repository root
NIX_TARGET=~/nix
DOTFILES_TARGET=~/.config

# Function to check if Stow is installed
check_stow() {
    if ! command -v stow &>/dev/null; then
        echo "Error: GNU Stow is not installed. Please install it and try again."
        exit 1
    fi
}

# Function to link nix folder using Stow
link_nix() {
    # Ensure Stow is installed
    check_stow
    echo "Symlinking 'nix' to $NIX_TARGET..."
    mkdir -p "$NIX_TARGET"
    stow --dir="$REPO_DIR" --target="$NIX_TARGET" nix
    echo "Symlinking 'nix' complete!"
}

# Function to unlink nix folder
unlink_nix() {
    # Ensure Stow is installed
    check_stow
    echo "Unlinking 'nix' from $NIX_TARGET..."
    stow -D --dir="$REPO_DIR" --target="$NIX_TARGET" nix
    echo "Unlinking 'nix' complete!"
}

# Function to link dotfiles folder using Stow
link_dotfiles() {
    # Ensure Stow is installed
    check_stow
    echo "Symlinking all folders in 'dotfiles' to $DOTFILES_TARGET..."
    mkdir -p "$DOTFILES_TARGET"
    cd "$REPO_DIR/dotfiles"
    stow --target="$DOTFILES_TARGET" *
    echo "Symlinking 'dotfiles' complete!"
}

# Function to unlink dotfiles folder
unlink_dotfiles() {
    # Ensure Stow is installed
    check_stow
    echo "Unlinking all folders in 'dotfiles' from $DOTFILES_TARGET..."
    cd "$REPO_DIR/dotfiles"
    stow -D --target="$DOTFILES_TARGET" *
    echo "Unlinking 'dotfiles' complete!"
}

# Function to copy nix folder
copy_nix() {
    echo "Copying 'nix' folder to $NIX_TARGET..."
    cp -r "$REPO_DIR/nix" "$NIX_TARGET"
    echo "Copying 'nix' complete!"
}

# Function to move nix folder
move_nix() {
    echo "Moving 'nix' folder to $NIX_TARGET..."
    mv "$REPO_DIR/nix" "$NIX_TARGET"
    echo "Moving 'nix' complete!"
}

# Display menu
show_menu() {
    echo "Select an option:"
    echo "1. Symlink 'nix' folder"
    echo "2. Unlink 'nix' folder"
    echo "3. Symlink 'dotfiles' folder"
    echo "4. Unlink 'dotfiles' folder"
    echo "5. Copy 'nix' folder to target"
    echo "6. Move 'nix' folder to target"
    echo "7. Exit"
}

# Function to execute command by name
execute_command() {
    case "$1" in
        link-nix)
            link_nix
            ;;
        unlink-nix)
            unlink_nix
            ;;
        link-dotfiles)
            link_dotfiles
            ;;
        unlink-dotfiles)
            unlink_dotfiles
            ;;
        copy-nix)
            copy_nix
            ;;
        move-nix)
            move_nix
            ;;
        help)
            echo "Available commands: link-nix, unlink-nix, link-dotfiles, unlink-dotfiles, copy-nix, move-nix"
            ;;
        *)
            echo "Invalid command: $1"
            echo "Available commands: link-nix, unlink-nix, link-dotfiles, unlink-dotfiles, copy-nix, move-nix"
            exit 1
            ;;
    esac
}

# Main function
main() {
    if [[ -n "$1" ]]; then
        execute_command "$1"
    else
        # Interactive menu loop
        while true; do
            show_menu
            read -p "Enter your choice: " choice

            case $choice in
                1)
                    link_nix
                    ;;
                2)
                    unlink_nix
                    ;;
                3)
                    link_dotfiles
                    ;;
                4)
                    unlink_dotfiles
                    ;;
                5)
                    copy_nix
                    ;;
                6)
                    move_nix
                    ;;
                7)
                    echo "Exiting script."
                    exit 0
                    ;;
                *)
                    echo "Invalid choice. Please try again."
                    ;;
            esac
        done
    fi
}

# Start script
main "$1"

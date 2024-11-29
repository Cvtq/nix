# Dotfiles

This repository contains my personal dotfiles, NixOS configurations, and scripts for managing and customizing system environment.

---

## Repository Structure

```plaintext

├── nix/                  # Nix configurations for NixOS and
│   ├── home-manager/     # Home Manager configurations
│   ├── nixos/            # NixOS system-level configurations
│   │   ├── disko.nix     # Disk partitioning configuration
│   │   ├── flake.nix     # Flake-based NixOS configuration
│   │   ├── nixos-menu.sh # Interactive menu with commands
│   │   ├── README.md     # NixOS installation instructions
├── dotfiles/             # Application and tool configuration files
│   ├── scirpts/          # Shell scripts
│   ├── nvim/             # Neovim configuration
│   ├── tmux/             # Tmux configuration
│   └── ...               # Other dotfiles for applications
└── LICENSE               # License file
├── menu.sh               # Interactive menu with commands
└── README.md             # This file
```

---

## Installation

### Prerequisites

* Git: To clone this repository.
* GNU Stow: Required for managing symlinks.
* NixOS: Required if you're using the Nix configurations.

For NixOS:

* Get ```git``` via ```nix-shell -p git``` or ```nix-env -iA nixos.git```
* Get ```stow``` via ```nix-shell -p stow``` or ```nix-env -iA stow.git```
* For detailed NixOS instructions read ```nix/README.md``` file.

### Steps

1. Clone the Repository:

```console
git clone https://github.com/Cvtq/dotfiles.git
cd dotfiles
```

2. Run interactive ```menu.sh``` to create symbolic links:

```console
sh menu.sh
```

or with commands:

```console
sh menu.sh link-nix
sh menu.sh link-dotfiles
```
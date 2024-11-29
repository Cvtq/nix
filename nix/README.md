# ❄️ NixOS Config


### Prerequisites

* Just make sure to check that ```disko.nix``` disk scheme is correct.

### Initial NixOS install

```console
nixos-generate-config --root /mnt
nixos-install
```

Possibly copy ```hardware-configuration.nix``` to ```~/nix/nixos/hardware-configuration.nix```

### Installation

You can manually type/copy commands or run relevant options from ```nixos-menu.sh```.

1. If you symlinked ```nix``` folder, it should already be in ```~/nix```. If not, or you don't want to use ```stow```, just copy or move manually:

```console
sh menu.sh copy-nix
```

2. Partition disk with ```disko```.

```console
nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko disko.nix
```

3. Install.

```console
nixos-rebuild switch --flake .
home-manager switch --flake .
```

After installation new convenient aliases are available:

```console
rb # for nixos-rebuild switch --flake ~/nix
hms # for home-manager switch --flake ~/nix
```

### Maintance

Cleaning:

```console
nix-store --gc
nix-collect-garbage -d
```
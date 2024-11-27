{ inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  disabledModules = [
    ./modules/xserver.nix
  ];

  networking.hostName = "nixos"; # Define your hostname.

  time.timeZone = "Asia/Tashkent"; # Set your time zone.

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

    nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes
#       substituters = [
#         #"http://binarycache.example.com"
#         "https://nix-community.cachix.org"
#         "https://cache.nixos.org/"
#       ];
#       trusted-public-keys = [
#         #"binarycache.example.com-1:dsafdafDFW123fdasfa123124FADSAD"
#         "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
#       ];
    };
  };


  system.stateVersion = "23.05"; # Don't change it bro
}

{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "raiden";
    homeDirectory = "/home/raiden";
    stateVersion = "23.11";
  };
}

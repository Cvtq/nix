{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.raiden = {
      isNormalUser = true;
      description = "Raiden";
      home  = "/home/raiden";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
      packages = with pkgs; [
        "brave"
      ];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "raiden";
}

{inputs, pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
#     # set the flake package
#     package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
#     # make sure to also set the portal package, so that they are in sync
#     portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  programs.hyprlock.enable = true;
  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}

{
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;

    displayManager = {
      autoLogin.enable = false;
      autoLogin.user = "raiden";
      lightdm.enable = false;
    };

    layout = "us";
    xkbVariant = "";

    libinput = {
      enable = true;
      # disabling mouse acceleration
      mouse.accelProfile = "flat";
      # disabling touchpad acceleration
      touchpad.accelProfile = "flat";
    };

    videoDrivers = ["nvidia"];
    deviceSection = ''Option "TearFree" "True"'';
    displayManager.gdm.enable = true;
    #desktopManager.gnome.enable = true;
  };
}

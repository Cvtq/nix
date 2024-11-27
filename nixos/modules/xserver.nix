{
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;

    displayManager = {
      autoLogin.enable = false;
      autoLogin.user = "raiden";
      lightdm.enable = true;
      #gdm.enable = true;
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

    #videoDrivers = ["nvidia"];
    deviceSection = ''Option "TearFree" "True"'';
  };
}

{
#   services.xserver = {
#     enable = true;
#     windowManager.herbstluftwm.enable = true;
#
#     displayManager = {
#       autoLogin.enable = true;
#       autoLogin.user = "raiden";
#       lightdm.enable = false;
#     };
#
#     layout = "us";
#     xkbVariant = "";
#
#     libinput = {
#       enable = true;
#       mouse.accelProfile = "flat";
#       touchpad.accelProfile = "flat";
#     };
#
#     videoDrivers = ["nvidia"];
#     deviceSection = ''Option "TearFree" "True"'';
#     #displayManager.gdm.enable = true;
#     #desktopManager.gnome.enable = true;
#   };
}

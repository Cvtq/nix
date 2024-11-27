{  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1";
      # Use alacritty as default terminal
      terminal = "foot";
      menu = "anyrun";

#       startup = [
#         {
#             # Launch on start
#             command = "waybar";
#         }
#       ];

      keybindings = {
            # Add a custom keybinding to open the terminal
            "${modifier}+t" = "exec ${terminal}";
            "${modifier}+c" = "kill";
            "${modifier}+r" = "exec ${menu}";
            "${modifier}+Shift+r" = "reload";
        };
    };
  };
}

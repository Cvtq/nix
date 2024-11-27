{  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1";
      # Use alacritty as default terminal
      terminal = "alacritty";
      startup = [
        # Launch Firefox on start
        {command = "alacritty";}
      ];
    };
  };
}

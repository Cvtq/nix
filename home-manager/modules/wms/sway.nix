{  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1";
      # Use alacritty as default terminal
      terminal = "alacritty";
      startup = [
        # Launch on start
        {
            command = "zsh";
        }
      ];
    };
  };
}

{

  imports = [
    ./opts.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins/plugins-bundle.nix
  ];

  programs.nixvim = {
    enable = false;

    defaultEditor = true;
    colorschemes.oxocarbon.enable = true;
  };
}

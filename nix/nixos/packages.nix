{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    alacritty
    foot
    rofi
    wofi
    mpv
    gparted
    pcmanfm-qt

    # Coding stuff
    gnumake
    gcc

    # CLI utils
    file
    tree
    wget
    git
    fastfetch
    htop
    nix-index
    scrot
    ffmpeg
    light
    lux
    mediainfo
    ranger
    zram-generator
    ntfs3g
    yt-dlp
    brightnessctl
    swww
    openssl
    lazygit
    bluez
    bluez-tools
    fzf
    atuin
    dust
    btop
    bat
    tldr
    eza
    ncdu
    gdu
    ranger
    trashy
    zoxide
    mc

    # GUI utils
    feh
    imv
    dmenu
    screenkey
    mako
    gromit-mpx
    vlc
    brave
    librewolf

    # Xorg stuff
    xterm
    xclip
    xorg.xbacklight

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist

    # WMs and stuff
    herbstluftwm
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    waybar
    anyrun
    hyprlock
    sway
    i3

    # Sound
    pipewire
    #pulseaudio
    pamixer

    # GPU stuff
#     amdvlk
#     rocm-opencl-icd
#     glaxnimate

    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy

    # Other
    home-manager
    lightdm
    gdm
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-nord
  ];

  fonts.packages = with pkgs; [
    ibm-plex
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}

{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "python-2.7.18.8" "electron-25.9.0" ];
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-sdk
    ];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    audacity
    inkscape
    qutebrowser
    alacritty
    rofi-wayland
    mpv
    obsidian
    zoom-us
    pcmanfm-qt
    xfce.thunar
    texliveFull
    # retroarchFull
    google-chrome
    evince

    # Coding stuff
    conda
    gnumake
    gcc
    nodejs
    julia-bin
    python
    (python3.withPackages (ps: with ps; [ requests ]))
    ripgrep
    pandoc
    vscode-fhs

    # CLI utils
    eza
    fastfetch
    file
    tree
    wget
    git
    htop
    nix-index
    unzip
    scrot
    ffmpeg
    light
    lux
    feh
    mediainfo
    ranger
    zram-generator
    cava
    zip
    ntfs3g
    yt-dlp
    brightnessctl
    openssl
    lazygit
    bluez
    bluez-tools
    linux-wifi-hotspot
    usbutils
    udiskie
    udisks

    # GUI utils
    imv
    mako
    blueman
    
    # Wayland stuff
    xwayland
    wl-clipboard
    # cliphist

    # WMs and stuff
    # herbstluftwm
    hyprland
    hyprpaper
    seatd
    xdg-desktop-portal-hyprland
    waybar
    wlogout

    # Sound
    pipewire
    pulseaudio
    pamixer

    # Other
    home-manager
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-nord
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    fira-sans
    fira-code
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}

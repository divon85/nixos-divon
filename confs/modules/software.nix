{ pkgs, ... }: {
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # Base
        neovim                          #text editor
        wget                            #terminal downloader
        git                             # You know la...!!!
        alacritty                       # Terminal
        zsh                             # Shell engine
        wpgtk                           # Color scheming
        python3                         # still need comment?
        swww                            # interactive wallpaper
        ffmpeg                          # Media codec
        fastfetch                       # its fun

        # File Manager
        yazi                            # Terminal file manager
        xfce.thunar                     # GUI file manager
        xfce.thunar-archive-plugin
        xfce.thunar-volman
        xfce.tumbler                    # For Thunar thumbnails
        ffmpegthumbnailer               # For video thumbnails
        gvfs                            # For trash support, mounts

        # Hyprland utils
        waybar                          # Status bar
        rofi-wayland                    # Application launcher
        wl-clipboard                    # Clipboard functionality

        # Apps
        firefox                         # Web browser
        grimblast                       # Screenshot tools

        # Fonts
        pkgs.typstPackages.fontawesome_0_4_0
        pkgs.noto-fonts-cjk-sans
        pkgs.noto-fonts-cjk-serif
        pkgs.noto-fonts-monochrome-emoji
        pkgs.noto-fonts-color-emoji
        pkgs.texlivePackages.japanese-otf
        pkgs.fira-sans
        pkgs.fira-code
    ];

    programs.firefox.enable = true;
    programs.zsh.enable = true;
}
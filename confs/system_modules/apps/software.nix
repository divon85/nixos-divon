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
        wlogout                         # logout function
        hyprlock
        hyprpaper
        hypridle

        # Apps
        firefox                         # Web browser
        grimblast                       # Screenshot tools

        # Fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji
	    font-awesome
        texlivePackages.japanese-otf
        fira-sans
        fira-code
        nerdfonts
        powerline
    ];

    programs.firefox.enable = true;
    programs.zsh.enable = true;
    programs.nix-ld.enable = true;
}

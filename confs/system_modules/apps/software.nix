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
        hyprpaper                       # wallpaper
        ffmpeg                          # Media codec
        fastfetch                       # its fun
        ntfs3g                          # mount and write ntfs drive
        starship                        # terminal styling
        xarchiver                       # extract, create, and editing archived files
        brightnessctl                   # Adjust screen brightness
        pipewire                        # Sound
        pwvucontrol                     # Pipewire volume control

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
        hyprlock                        # lockscreen in hyprland
        hypridle                        # enable sleep when idling in hyprland

        # Apps
        firefox                         # Web browser
        grimblast                       # Screenshot tools



        # Programming Language
        libgcc                          # C and C++
        julia                           # Julia programming
        conda
        jdks = [
            graalvm-ce
            zulu8
            zulu17
            zulu
        ]

        # Fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji
        font-awesome
        nerd-fonts.symbols-only
        fira-sans
        fira-code
        fira-code-symbols
        roboto
        liberation_ttf
        texlivePackages.japanese-otf
    ];

    programs.firefox.enable = true;
    programs.zsh.enable = true;
    programs.nix-ld.enable = true;
}

{ pkgs, ... }:
{
    home.packages = with pkgs; [
        # Games
        (retroarch.withCores (cores: with cores;[
            mgba
            mesen
            genesis-plus-gx
            swanstation
        ]))

        # Editor
        vscode

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

        # Utilities
        yazi
        celluloid
        firefox                                         # Web browser
        xfce.thunar                                     # GUI file manager
        xfce.thunar-archive-plugin
        xfce.thunar-volman
        xfce.tumbler                                    # For Thunar thumbnails
        ffmpegthumbnailer                               # For video thumbnails

        # Hyprland utils
        waybar                                          # Status bar
        rofi-wayland                                    # Application launcher
        wl-clipboard                                    # Clipboard functionality
        wlogout                                         # logout function
        hyprlock                                        # lockscreen in hyprland
        hypridle                                        # enable sleep when idling in hyprland
        hyprpaper                                       # wallpaper
    ];

    programs.firefox.enable = true;
}

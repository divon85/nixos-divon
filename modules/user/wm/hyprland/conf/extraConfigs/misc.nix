{
    wayland.windowManager.hyprland = {
        extraConfig = ''
            # https://wiki.hyprland.org/Configuring/Variables/#misc
            misc {
                force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
                disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
            }
        '';
    };
}
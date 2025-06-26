{
    wayland.windowManager.hyprland = {
        extraConfig = ''
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            general {
                gaps_in = 2
                gaps_out = 5
                border_size = 1
                col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
                col.inactive_border = rgba(595959aa)
                allow_tearing = false
                layout = dwindle
                resize_on_border = true
            }
        '';
    };
}
{
    wayland.windowManager.hyprland = {
        extraConfig = ''
            # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
            dwindle {
                pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                preserve_split = true # You probably want this
            }

            # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
            master {
                new_status = master
            }
        '';
    };
}
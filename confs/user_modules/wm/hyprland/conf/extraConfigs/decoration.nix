{
    wayland.windowManager.hyprland = {
        extraConfig = ''
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            decoration {
                rounding = 10
                rounding_power = 2

                # Change transparency of focused and unfocused windows
                active_opacity = 1.0
                inactive_opacity = 0.8

                blur {
                    enabled = true
                    size = 3
                    passes = 1
                    vibrancy = 0.1696
                }

                shadow {
                    enabled = true
                    range = 4
                    render_power = 3
                    color = rgba(1a1a1aee)
                }
            }
        '';
    };
}
{
    wayland.windowManager.hyprland = {
        extraConfig = ''
            # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
            animations {
                enabled = true
                bezier = myBezier, 0.05, 0.9, 0.1, 1.05
                animation = windows, 1, 7, myBezier
                animation = windowsOut, 1, 7, default, popin 80%
                animation = border, 1, 10, default
                animation = borderangle, 1, 8, default
                animation = fade, 1, 7, default
                animation = workspaces, 1, 6, default
            }
        '';
    };
}
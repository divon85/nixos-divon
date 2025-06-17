{ inputs, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
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

            # Execute your favorite apps at launch
            exec-once = waybar
            exec-once = hyprpaper
            exec-once = dunst

            # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
            bind = SUPER, RETURN, exec, alacritty # Open Alactritty
            bind = SUPER, Q, killactive # Close current window
            bind = SUPER CTRL, Q, exec, ~/.dotfiles/scripts/logout.sh # Close current window
            bind = SUPER, M, exit # Exit Hyprland
            bind = SUPER, E, exec, ~/.dotfiles/scripts/filemanager.sh # Opens the filemanager
            bind = SUPER, T, togglefloating # Toggle between tiling and floating window
            bind = SUPER, F, fullscreen # Open the window in fullscreen
            bind = SUPER, SPACE, exec, rofi -show drun # Open rofi
            bind = SUPER, P, pseudo, # dwindle
            bind = SUPER, J, togglesplit, # dwindle
            bind = SUPER, B, exec, ~/.dotfiles/scripts/browser.sh # Opens the browser
            bind = SUPER SHIFT, B, exec, ~/.dotfiles/scripts/reload-waybar.sh # Reload Waybar
            bind = SUPER SHIFT, W, exec, ~/.dotfiles/scripts/reload-hyprpaper.sh # Reload hyprpaper after a changing the wallpaper

            # Move focus with mainMod + arrow keys
            bind = SUPER, left, movefocus, l # Move focus left
            bind = SUPER, right, movefocus, r # Move focus right
            bind = SUPER, up, movefocus, u # Move focus up
            bind = SUPER, down, movefocus, d # Move focus down

            # Switch workspaces with mainMod + [0-9]
            bind = SUPER, 1, workspace, 1 # Switch to workspace 1
            bind = SUPER, 2, workspace, 2 # Switch to workspace 2
            bind = SUPER, 3, workspace, 3 # Switch to workspace 3
            bind = SUPER, 4, workspace, 4 # Switch to workspace 4
            bind = SUPER, 5, workspace, 5 # Switch to workspace 5
            bind = SUPER, 6, workspace, 6 # Switch to workspace 6
            bind = SUPER, 7, workspace, 7 # Switch to workspace 7
            bind = SUPER, 8, workspace, 8 # Switch to workspace 8
            bind = SUPER, 9, workspace, 9 # Switch to workspace 9
            bind = SUPER, 0, workspace, 10 # Switch to workspace 10

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            bind = SUPER SHIFT, 1, movetoworkspace, 1 #  Move window to workspace 1
            bind = SUPER SHIFT, 2, movetoworkspace, 2 #  Move window to workspace 2
            bind = SUPER SHIFT, 3, movetoworkspace, 3 #  Move window to workspace 3
            bind = SUPER SHIFT, 4, movetoworkspace, 4 #  Move window to workspace 4
            bind = SUPER SHIFT, 5, movetoworkspace, 5 #  Move window to workspace 5
            bind = SUPER SHIFT, 6, movetoworkspace, 6 #  Move window to workspace 6
            bind = SUPER SHIFT, 7, movetoworkspace, 7 #  Move window to workspace 7
            bind = SUPER SHIFT, 8, movetoworkspace, 8 #  Move window to workspace 8
            bind = SUPER SHIFT, 9, movetoworkspace, 9 #  Move window to workspace 9
            bind = SUPER SHIFT, 0, movetoworkspace, 10 #  Move window to workspace 10

            # Scroll through existing workspaces with mainMod + scroll
            bind = SUPER, mouse_down, workspace, e+1 # Scroll workspaces 
            bind = SUPER, mouse_up, workspace, e-1 # Scroll workspaces

            # Move/resize windows with mainMod + LMB/RMB and dragging
            bindm = SUPER, mouse:272, movewindow # Move window
            bindm = SUPER, mouse:273, resizewindow # Resize window

            # Fn keys
            bind = , XF86MonBrightnessUp, exec, brightnessctl -q s 10%+
            bind = , XF86MonBrightnessDown, exec, brightnessctl -q s 10%-
            bind = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
            bind = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
            bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            bind = , XF86AudioPlay, exec, playerctl play-pause
            bind = , XF86AudioPause, exec, playerctl pause
            bind = , XF86AudioNext, exec, playerctl next
            bind = , XF86AudioPrev, exec, playerctl previous
            bind = , XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle
            bind = , XF86Calculator, exec, qalculate-gtk
            bind = , XF86Lock, exec, hyprlock

            env = XCURSOR_SIZE,24

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

            # QT
            env = QT_QPA_PLATFORM,wayland;xcb
            env = QT_QPA_PLATFORMTHEME,qt6ct
            env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
            env = QT_AUTO_SCREEN_SCALE_FACTOR,1

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

            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            gestures {
                workspace_swipe = true
            }

            # https://wiki.hyprland.org/Configuring/Variables/#input
            input {
                kb_layout = jp
                kb_variant =
                kb_model =
                kb_options =
                kb_rules =

                follow_mouse = 1

                sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

                touchpad {
                    natural_scroll = false
                }
            }

            # Example per-device config
            # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
            device {
                name = epic-mouse-v1
                sensitivity = -0.5
            }

            # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
            dwindle {
                pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                preserve_split = true # You probably want this
            }

            # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
            master {
                new_status = master
            }

            # https://wiki.hyprland.org/Configuring/Variables/#misc
            misc {
                force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
                disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
            }

            # See https://wiki.hyprland.org/Configuring/Monitors/
            monitor=,preferred,auto,auto
        '';
    };
}

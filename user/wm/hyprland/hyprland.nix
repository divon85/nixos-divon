{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
    imports = [
        ../../app/terminal/alacritty.nix
        ../../app/terminal/kitty.nix
        (import ../../app/dmenu-scripts/networkmanager-dmenu.nix { dmenu_command = "fuzzel -d"; inherit config lib pkgs; })
        ../input/nihongo.nix
    ] ++
    (if (systemSettings.profile == "personal") then [ (import ./hyprprofiles/hyprprofiles.nix { dmenuCmd = "fuzzel -d"; inherit config lib pkgs; } ) ] else [] );
    gtk.cursorTheme = {
        package = pkgs.quintom-cursor-theme;
        name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
        size = 36;
    };

    wayland.windowManager.hyprland = {
        enable = true;
        plugins = [ ];
        settings = { };
        extraConfig = ''
            # monitor
            source = ./conf/monitor.conf

            # auto start
            source = ./conf/autostart.conf

            # environment
            source = ./conf/environment.conf

            # keyboard and touchpad
            source = ./conf/keyboard.conf

            # window
            source = ./conf/window.conf

            # decoration
            source = ./conf/decoration.conf

            # layout
            source = ./conf/layout.conf

            # misc
            source = ./conf/misc.conf

            # animation
            source = ./conf/animation.conf

            # rule
            source = ./conf/rule.conf

            # keybinding
            source = ./conf/keybinding.conf
        '';
    }
}
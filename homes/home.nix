{ pkgs, userSettings, ... }:
{
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    programs.home-manager.enable = true;

    imports = [
        ./modules/icons.nix
        ./modules/shells.nix
        # ./modules/software.nix
        ./modules/xdgs.nix
        ./modules/hyprland/hyprland.nix
    ];

    home.stateVersion = "25.05";
}
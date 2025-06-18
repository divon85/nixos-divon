{ pkgs, userSettings, ... }:
{
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    programs.home-manager.enable = true;

    imports = [
        ./home_modules/bundles.nix
    ];

    home.stateVersion = "25.05";
}
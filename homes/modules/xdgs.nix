{ config, pkgs, ... }:
{
    xdg = {
        enable = true;
        portal = {
            enable = true;
            extraPortals = [
                pkgs.xdg-desktop-portal
                pkgs.xdg-desktop-portal-gtk
            ];
        };
        userDirs = {
            enable = true;
            createDirectories = true;
            documents = "${config.home.homeDirectory}/Documents";
            download = "${config.home.homeDirectory}/Downloads";
            ebooks = "${config.home.homeDirectory}/Documents/Ebooks";
            music = "${config.home.homeDirectory}/Music";
            pictures = "${config.home.homeDirectory}/Pictures";
            projects = "${config.home.homeDirectory}/Documents/Projects";
        };
    };
}
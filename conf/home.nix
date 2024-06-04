{ config, pkgs, userSettings, ... }:

{
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;
    
    programs.home-manager.enable = true;

    imports = [
        (./. + "../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
        ../user/app/games.nix # Various videogame apps
        ../user/app/git.nix # My git config
        ../user/app/keepass.nix # My password manager
        ../user/app/ranger/ranger.nix # My ranger file manager config
        ../user/hardware/bluetooth.nix # Bluetooth
        ../user/lang/cc.nix # C and C++ tools
        ../user/lang/godot.nix # Game development
        ../user/shell/sh.nix # My zsh and bash config
        ../user/shell/cli-collection.nix # Useful CLI apps
    ];

    home.stateVersion = "24.05"; # Please read the comment before changing.

    home.packages = (with pkgs; [
        # Core
        zsh
        alacritty
        google-chrome
        dmenu
        rofi
        git
        syncthing
        gnome.nautilus

        # Office
        openboard
        texliveSmall
        numbat

        # Media
        inkscape
        vlc
        ffmpeg

        # Styling
        gnome.adwaita-icon-theme
        gnome.seahorse
        element-desktop-wayland
    ]);

    services.syncthing.enable = true;

    xdg.enable = true;
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
        music = "${config.home.homeDirectory}/Media/Music";
        videos = "${config.home.homeDirectory}/Media/Videos";
        pictures = "${config.home.homeDirectory}/Media/Pictures";
        websites = "${config.home.homeDirectory}/www";
        download = "${config.home.homeDirectory}/Downloads";
        documents = "${config.home.homeDirectory}/Documents";
        desktop = null;
        publicShare = null;
        extraConfig = {
            XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
            XDG_VM_DIR = "${config.home.homeDirectory}/VMs";
        };
    };
    xdg.mime.enable = true;
    xdg.mimeApps.enable = true;

    home.sessionVariables = {
        # EDITOR = userSettings.editor;
        TERM = userSettings.term;
        BROWSER = userSettings.browser;
    };
}
{ config, pkgs, pkgs-kdenlive, userSettings, ... }:

{
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    programs.home-manager.enable = true;

    imports = [
        (./. + "../../user/app/browser"+("/"+userSettings.browser)+".nix") # My default browser selected from flake
        ../user/app/games/games.nix # Various videogame apps
        ../user/app/git/git.nix # My git config
        ../user/app/keepass/keepass.nix # My password manager
        ../user/app/ranger/ranger.nix # My ranger file manager config
        ../user/app/virtualization/virtualization.nix # Virtual machines
        ../user/hardware/bluetooth.nix # Bluetooth
        ../user/lang/cc/cc.nix # C and C++ tools
        ../user/lang/godot/godot.nix # Game development
        ../user/shell/sh.nix # My zsh and bash config
        ../user/shell/cli-collection.nix # Useful CLI apps
        ../user/style/stylix.nix # Styling and themes for my apps
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
        templates = "${config.home.homeDirectory}/Templates";
        download = "${config.home.homeDirectory}/Downloads";
        documents = "${config.home.homeDirectory}/Documents";
        desktop = null;
        publicShare = null;
        extraConfig = {
            XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
            XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
            XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
            XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
            XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
            XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
            XDG_GAME_DIR = "${config.home.homeDirectory}/Media/Games";
            XDG_GAME_SAVE_DIR = "${config.home.homeDirectory}/Media/Game Saves";
        };
    };
    xdg.mime.enable = true;
    xdg.mimeApps.enable = true;
    xdg.mimeApps.associations.added = {
        # TODO fix mime associations, most of them are totally broken :(
        # "application/octet-stream" = "flstudio.desktop;";
    };

    home.sessionVariables = {
        # EDITOR = userSettings.editor;
        # SPAWNEDITOR = userSettings.spawnEditor;
        # TERM = userSettings.term;
        # BROWSER = userSettings.browser;
    };

}
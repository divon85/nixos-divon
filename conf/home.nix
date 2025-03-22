{ config, pkgs, userSettings, ... }:

{
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    programs.home-manager.enable = true;

    imports = [ 
        # (./. + "../../user/app/browser"+("/"+userSettings.browser)+".nix") # Default browser selected from flake
        ../user/app/games.nix # Various videogame apps
        ../user/app/git.nix # Git config
        ../user/app/nvim.nix # Neovim config
        ../user/hardware/bluetooth.nix # Bluetooth
        ../user/lang/cc.nix # C and C++ tools
        ../user/lang/python/python.nix # Python
        ../user/shell/sh.nix # My zsh and bash config
        ../user/shell/cli-collection.nix # Useful CLI apps
        #../user/style/stylix.nix # Styling and themes for my apps
        (./. + "../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
    ];

    home.stateVersion = "24.11"; # Please read the comment before changing.

    home.packages = with pkgs; [
        # Core
        zsh
        alacritty
        qutebrowser
        git

        # Office
        evince
        gnome.nautilus
        element-desktop-wayland
        inkscape

        # Entertainment
        ffmpeg
        libmediainfo
        mediainfo
        mpv
    ];

    xdg = {
        enable = true;
        userDirs = {
            enable = true;
            createDirectories = true;
            documents = "${config.home.homeDirectory}/Documents";
            download = "${config.home.homeDirectory}/Downloads";
            ebooks = "${config.home.homeDirectory}/Documents/My eBooks";
            music = "${config.home.homeDirectory}/Media/Music";
            pictures = "${config.home.homeDirectory}/Media/Pictures";
            videos = "${config.home.homeDirectory}/Media/Videos";
            web_server = "${config.home.homeDirectory}/WWW";
            desktop = null;
            publicShare = null;
            extraConfig = {
                XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
            };
        };
    };
    xdg.mime.enable = true;
    xdg.mimeApps.enable = true;

    home.sessionVariables = {
        EDITOR = userSettings.editor;
        SPAWNEDITOR = userSettings.spawnEditor;
        TERM = userSettings.term;
        BROWSER = userSettings.browser;
    };

    gtk.iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = if (config.stylix.polarity == "dark") then "Papirus-Dark" else "Papirus-Light";
    };

    services.pasystray.enable = true;
}

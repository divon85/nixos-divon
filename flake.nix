{
    description = "Divon NixOS flakes...";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

        # home-manager = {
        #     url = "github:nix-community/home-manager/release-24.11";
        #     inputs.nixpkgs.follows = "nixpkgs";
        # };

        # hyprland = {
        #     url = "github:hyprwm/Hyprland";
        #     inputs.nixpkgs.follows = "nixpkgs";
        # };

        # hyprland-plugins = {
        #     url = "github:hyprwm/hyprland-plugins";
        #     inputs.hyprland.follows = "hyprland";
        # };

        # hyprlock = {
        #     url = "github:hyprwm/hyprlock";
        #     inputs.nixpkgs.follows = "nixpkgs";
        # };

        # stylix.url = "github:danth/stylix";
    };

    outputs = inputs@{ self, ... }:
    let
    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
        system = "x86_64-linux"; # system architecture
        hostname = "divon-machina"; # set this according to the hostname of the machine
        timezone = "Asia/Tokyo";
        locale = "en_US.UTF-8";
        bootMode = "uefi"; # bios or uefi
        bootMountPath = "/boot";
        grubDevice = "/dev/sda"; # device identifier for grub; only used for legacy (bios) boot mode
        gpuType = "amd"; # amd, nvidia
    };

    # ---- USER SETTINGS ---- #
    userSettings = {
        username = "divon"; # username
        name = "Igor Novid"; # name/identifier
        email = "igornovid@outlook.com"; # email (used for certain configurations)
        dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
        theme = "io"; # selcted theme from my themes directory (./themes/)
        wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
        # window manager type (hyprland or x11) translator
        wmType = "wayland";
        browser = "qutebrowser"; # Default browser; must select one from ./user/app/browser/
        spawnBrowser = "qutebrowser-hyprprofile";
        term = "alacritty"; # Default terminal command;
        font = "Intel One Mono"; # Selected font
        fontPkg = pkgs.intel-one-mono; # Font package
        editor = "neovide"; # Default editor;
        spawnEditor = "neovide -- --listen /tmp/nvimsocket";
    };

    lib = inputs.nixpkgs.lib;

    pkgs = import inputs.nixpkgs {
        system = systemSettings.system;
        config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
        };
    };

    in {
        nixosConfigurations = {
            system = lib.nixosSystem {
                system = systemSettings.system;
                modules = [
                    ./conf/configuration.nix
                ];
                specialArgs = {
                    inherit systemSettings;
                    inherit userSettings;
                    inherit inputs;
                };
            };
        };
    };
}

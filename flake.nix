{
    description = "Divon NixOS Flakes";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

        hyprland.url = "github:hyprwm/Hyprland";

        # home-manager = {
        #     url = "github:nix-community/home-manager";
        #     inputs.nixpkgs.follows = "nixpkgs";
        # };
    };

    outputs = inputs@{ self, ... }:
    let
    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
        architecture = "x86_64-linux"; #system architecture
        hostname = "igor-nixos";
        timezone = "Asia/Tokyo";
        locale = "en_US.UTF-8";
        bootMode = "uefi"; # bios or uefi
        bootMountPath = "/BOOT";
        grubDevice = "/dev/sda"; # device identifier for grub; only used for legacy (bios) boot mode
    };

    # ---- USER SETTINGS ---- #
    userSettings = {
        username = "igor";
        name = "Igor Novid";
        email = "igornovid@outlook.com";
        dotfilesDir = "~/.dotfiles";
    };

    lib = inputs.nixpkgs.lib;

    in {
        nixosConfigurations = {
            confs = lib.nixosSystem {
                architecture = systemSettings.architecture;
                modules = [
                    ./confs/configuration.nix
                    # inputs.home-manager.nixosModules.default
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
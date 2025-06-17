{
    description = "Divon NixOS Flakes";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

        hyprland.url = "github:hyprwm/Hyprland";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
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

    pkgs = import inputs.nixpkgs {
        system = systemSettings.architecture;
        config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
        };
    };

    in {
        nixosConfigurations = {
            igor-nixos = lib.nixosSystem {
                system = systemSettings.architecture;
                modules = [
                    ./confs/configuration.nix
                    inputs.home-manager.nixosModules.default
                    ];
                specialArgs = {
                    inherit systemSettings;
                    inherit userSettings;
                    inherit inputs;
                };
            };
        };

        homeConfigurations = {
            igor = inputs.home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./homes/home.nix
                ];
                extraSpecialArgs = {
                    inherit systemSettings;
                    inherit userSettings;
                    inherit inputs;
                };
            };
        };
    };
}

{

    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.11";
    };
    
    outputs = { self, nixpkgs, ... }:
    let
        # ---- SYSTEM SETTINGS ---- #
        systemSettings = {
            system = "x86_64-linux"; # system arch
            hostname = "leptop-igor"; # hostname
            timezone = "Asia/Tokyo"; # select timezone
            locale = "en_US.UTF-8"; # select locale
            bootMode = "uefi"; # uefi or bios
            bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
            grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
        };

    pkgs = import nixpkgs {
        system = systemSettings.system;
        config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
        };
    };

        lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
            system = lib.nixosSystem {
                system = systemSettings.system;
                modules = [
                    ./conf/configuration.nix
                ];
            };
        };
    };
}
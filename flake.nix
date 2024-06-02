{

    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";

        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    
    outputs = inputs@{ self, ... }:
    let
        # ---- SYSTEM SETTINGS ---- #
        systemSettings = {
            system = "x86_64-linux"; # system arch
            hostname = "leptop-igor"; # hostname
            timezone = "Asia/Tokyo"; # select timezone
            locale = "en_US.UTF-8"; # select locale
            bootMode = "uefi"; # uefi or bios
            bootMountPath = "/BOOT"; # mount path for efi boot partition; only used for uefi boot mode
            grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
        };

        # ---- USER SETTINGS ---- #
        userSettings = {
            username = "igor";
            name = "Igor Novid";
            email = "igornovid@outlook.com";
            dotfilesDir = "~/.dotfiles";
            theme = "uwunicorn-yt";
            wm = "hyprland";
            # wmType = if (wm == "hyprland") then "wayland" else "x11";
            browser = "google-chrome"; # Default browser; must select one from ./user/app/browser/
            term = "alacritty"; # Default terminal command;
            font = "Intel One Mono"; # Selected font
            fontPkg = pkgs.intel-one-mono; # Font package
        };

        lib = nixpkgs.lib;

        pkgs = import nixpkgs {
            system = systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };

        home-manager = inputs.home-manager;

    in {
        homeConfigurations = {
            user = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./conf/home.nix
                ];
                extraSpecialArgs = {
                    inherit systemSettings;
                    inherit userSettings;
                    inherit inputs;
                }
            };
        };

        nixosConfigurations = {
            system = lib.nixosSystem {
                system = systemSettings.system;
                modules = [
                    ./conf/configuration.nix
                    ./conf/script.nix
                ];
                specialArgs = {
                    # pass config variables from above
                    inherit pkgs;
                    inherit systemSettings;
                    inherit userSettings;
                    inherit inputs;
                };
            };
        };
    };
}
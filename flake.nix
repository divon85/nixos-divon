{
    description = "My NixOS Flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.11";

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix.url = "github:danth/stylix";

        rust-overlay.url = "github:oxalica/rust-overlay";

        blocklist-hosts = {
            url = "github:StevenBlack/hosts";
            flake = false;
        };

        hyprland.url = "github:hyprwm/hyprland";
        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            flake = false;
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, stylix, rust-overlay, blocklist-hosts, hyprland, hyprland-plugins, ... }:
    
    let
        # ---- SYSTEM SETTINGS ---- #
        systemSettings = {
            system = "x86_64-linux"; # system arch
            hostname = "leptop-igor"; # hostname
            profile = "personal"; # select a profile defined from my profiles directory
            timezone = "Asia/Tokyo"; # select timezone
            locale = "en_US.UTF-8"; # select locale
            bootMode = "uefi"; # uefi or bios
            bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
            grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
        };

        # ---- USER SETTINGS ---- #
        userSettings = rec {
            username = "igor"; # username
            name = "Igor Novid"; # name/identifier
            email = "igornovid@outlook.com"; # email (used for certain configurations)
            dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
            theme = "uwunicorn-yt"; # selcted theme from my themes directory (./themes/)
            wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
            # window manager type (hyprland or x11) translator
            wmType = if (wm == "hyprland") then "wayland" else "x11";
            browser = "brave"; # Default browser; must select one from ./user/app/browser/
            defaultRoamDir = "Personal.p"; # Default org roam directory relative to ~/Org
            term = "alacritty"; # Default terminal command;
            font = "Intel One Mono"; # Selected font
            fontPkg = pkgs.intel-one-mono; # Font package
            editor = "code"; # Default editor;
            # editor spawning translator
            # generates a command that can be used to spawn editor inside a gui
            # EDITOR and TERM session variables must be set in home.nix or other module
            # I set the session variable SPAWNEDITOR to this in my home.nix for convenience
            spawnEditor = if ((editor == "vim") || (editor == "nvim") || (editor == "nano")) then "exec " + term + " -e " + editor else editor;
        };

        pkgs = import nixpkgs {
            system = systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };

        # configure lib
        lib = nixpkgs.lib;

        # Systems that can run tests:
        supportedSystems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];

        # Function to generate a set based on supported systems:
        forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;

        # Attribute set of nixpkgs for each system:
        nixpkgsFor = forAllSystems (system: import inputs.nixpkgs { inherit system; });

    in {
        homeConfigurations = {
            user = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix") # load home.nix from selected PROFILE
                ];
                extraSpecialArgs = {
                    # pass config variables from above
                    inherit pkgs;
                    inherit systemSettings;
                    inherit userSettings;
                    #inherit (inputs) nix-flatpak;
                    inherit (inputs) stylix;
                    inherit (inputs) hyprland;
                };
            };
        };
        nixosConfigurations = {
            system = lib.nixosSystem {
                system = systemSettings.system;
                modules = [
                (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
                ]; # load configuration.nix from selected PROFILE
                specialArgs = {
                    # pass config variables from above
                    inherit pkgs;
                    inherit systemSettings;
                    inherit userSettings;
                    inherit (inputs) stylix;
                    inherit (inputs) blocklist-hosts;
                };
            };
        };

        packages = forAllSystems (system:
            let pkgs = nixpkgsFor.${system};
            in {
                default = self.packages.${system}.install;

                install = pkgs.writeShellApplication {
                    name = "install";
                    runtimeInputs = with pkgs; [ git ]; # I could make this fancier by adding other deps
                    text = ''${./install.sh} "$@"'';
            };
        });

        apps = forAllSystems (system: {
        default = self.apps.${system}.install;

        install = {
        type = "app";
        program = "${self.packages.${system}.install}/bin/install";
        };
        });
    };
}
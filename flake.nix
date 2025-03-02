{
  description = "Divon NixOS flakes...";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager-unstable.url = "github:nix-community/home-manager/master";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";
    home-manager-stable.url = "github:nix-community/home-manager/release-24.05";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    hyprland = {
      url = "github:hyprwm/Hyprland/v0.44.1?submodules=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      type = "git";
      url = "https://code.hyprland.org/hyprwm/hyprland-plugins.git";
      rev = "4d7f0b5d8b952f31f7d2e29af22ab0a55ca5c219"; #v0.44.1
      inputs.hyprland.follows = "hyprland";
    };
    hyprlock = {
      type = "git";
      url = "https://code.hyprland.org/hyprwm/hyprlock.git";
      rev = "73b0fc26c0e2f6f82f9d9f5b02e660a958902763";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprgrass.url = "github:horriblename/hyprgrass/427690aec574fec75f5b7b800ac4a0b4c8e4b1d5";
    hyprgrass.inputs.hyprland.follows = "hyprland";

    stylix.url = "github:danth/stylix";

    rust-overlay.url = "github:oxalica/rust-overlay";

    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;

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
    bootMountPath = "/BOOT";
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
    wmType = if ((wm == "hyprland") || (wm == "plasma")) then "wayland" else "x11";
    browser = "qutebrowser"; # Default browser; must select one from ./user/app/browser/
    spawnBrowser = if ((browser == "qutebrowser") && (wm == "hyprland")) then "qutebrowser-hyprprofile" else (if (browser == "qutebrowser") then "qutebrowser --qt-flag enable-gpu-rasterization --qt-flag enable-native-gpu-memory-buffers --qt-flag num-raster-threads=4" else browser); # Browser spawn command must be specail for qb, since it doesn't gpu accelerate by default (why?)
  };

  lib = inputs.nixpkgs.lib;

  pkgs = import inputs.nixpkgs {
    system = systemSettings.system;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
    overlays = [ inputs.rust-overlay.overlays.default ];
  };

  pkgs-stable = import inputs.nixpkgs-stable {
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
          inherit pkgs-stable;
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
        };
      };
    };
  };
}

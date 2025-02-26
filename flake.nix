{
  description = "Divon NixOS flakes...";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = inputs@{ self, ... }:
  let
  # ---- SYSTEM SETTINGS ---- #
  systemSettings = {
    system = "x86_64-linux"; # system architecture
    hostname = "divon-machina";
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
    system = systemSettings.system;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
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

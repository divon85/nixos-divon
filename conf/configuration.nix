# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:
{
  imports =
  [ 
    ../system/hardware-configuration.nix
    # ( import ../system/app/docker.nix {storageDriver = null; inherit pkgs userSettings lib;} )
    # ../system/app/gamemode.nix
    # ../system/app/prismlauncher.nix
    # ../system/app/steam.nix
    # ../system/app/virtualization.nix
    # ../system/hardware/bluetooth.nix
    # ../system/hardware/kernel.nix # Kernel config
    # ../system/hardware/opengl.nix
    # ../system/hardware/power.nix # Power management
    # ../system/hardware/printing.nix
    # ../system/hardware/systemd.nix # systemd config
    # ../system/hardware/time.nix # Network time sync
    # ../system/security/automount.nix
    # ../system/security/blocklist.nix
    # ../system/security/doas.nix
    # ../system/security/firejail.nix
    # ../system/security/firewall.nix
    # ../system/security/gpg.nix
    # ../system/security/openvpn.nix
    # ../system/style/stylix.nix
    # ../system/wm/hyprland.nix
  ];
}
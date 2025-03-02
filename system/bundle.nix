{
  imports = [
    ./hardware-configuration.nix
    ( import ./system/app/docker.nix {storageDriver = null; inherit pkgs userSettings lib;} )
    ./system/app/virtualization.nix
    ./system/hardware/bluetooth.nix
    ./system/hardware/kernel.nix
    ./system/hardware/opengl.nix
    ./system/hardware/power.nix
    ./system/hardware/printing.nix
    ./system/hardware/systemd.nix
    ./system/hardware/time.nix
    ./system/security/automount.nix
    ./system/security/blocklist.nix
    ./system/security/doas.nix
    ./system/security/firejail.nix
  ];
}
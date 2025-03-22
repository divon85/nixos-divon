{
  imports = [
    ./hardware-configuration.nix
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
    ./system/style/stylix.nix
    (./. + "../system/wm"+("/"+userSettings.wm)+".nix") # My window manager
  ];
}
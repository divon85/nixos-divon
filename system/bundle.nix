{ userSettings, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware/bluetooth.nix
    ./hardware/kernel.nix
    ./hardware/opengl.nix
    ./hardware/power.nix
    ./hardware/printing.nix
    ./hardware/systemd.nix
    ./hardware/time.nix
    ./security/automount.nix
    ./security/blocklist.nix
    ./security/doas.nix
    ./security/firejail.nix
    # ./style/stylix.nix
    # (./. + "../wm"+("/"+userSettings.wm)+".nix") # My window manager
  ];
}
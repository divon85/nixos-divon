{
  imports = [
    ./hardware-configuration.nix
    # ./hyprland.nix
    # ./app/cli.nix
    ./app/desktop.nix
    ./app/fonts.nix
    # ./app/hyprland.nix
    # ./app/programming.nix
    ./hardware/bluetooth.nix
    ./hardware/bootloader.nix
    ./hardware/graphics.nix
    ./hardware/networking.nix
    # ./hardware/printing.nix
    ./hardware/sound.nix
    ./hardware/time.nix
    ./hardware/trim.nix
    ./hardware/zram.nix
    ./security/blocklist.nix
    ./security/doas.nix
    ./security/firewall.nix
    ./security/gc.nix
    ./security/gpg.nix
    # ./security/openvpn.nix
    # ./security/sshd.nix
    ./sysconf/dbus.nix
    ./sysconf/env.nix
    ./sysconf/nixconf.nix
    ./sysconf/user.nix
    ./sysconf/xserver.nix
  ];
}

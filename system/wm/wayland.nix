{ config, pkgs, ... }:

{
  imports = [ ./pipewire.nix
              ./dbus.nix
              ./gnome-keyring.nix
              ./fonts.nix
            ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "jp 106";
      variant = "";
      options = "caps:escape";
    };
  };
}

{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Wayland stuff
    xwayland

    # Hyprland stuff
    hyprland
    hyprpaper
    seatd
    xdg-desktop-portal-hyprland
    waybar
    wlogout
  ];
}

{ inputs, pkgs, ... }:
{
  # Enable Hyprland
  programs.hyprland.enable = true;
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    systemPackages = with pkgs; [
      hyprcursor
      hyprlock
      hypridle
      hyprpaper
      wlogout
    ];
  };
}

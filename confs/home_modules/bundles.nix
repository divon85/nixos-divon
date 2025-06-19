{ inputs, ... }:
{
    imports = [
        ./apps/nvim.nix
        ./apps/shells.nix
        ./apps/software.nix
        ./apps/starship/starship.nix
        ./style/stylix.nix
        ./system/icons.nix
        ./system/xdgs.nix
        ./wm/hyprland/hyprland.nix
        ./wm/waybar/waybar.nix
        inputs.stylix.homeModules.stylix
    ];
}

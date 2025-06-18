{ inputs, ... }:
{
    imports = [
        ./apps/shells.nix
        ./apps/nvim.nix
        ./style/stylix.nix
        ./system/icons.nix
        ./system/xdgs.nix
        ./wm/hyprland/hyprland.nix
        inputs.stylix.homeModules.stylix
    ];
}

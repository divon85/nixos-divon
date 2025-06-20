{ inputs, ... }:
{
    imports = [
        ./apps/rofi/rofi.nix
        ./apps/starship/starship.nix
        ./apps/vscode/vscode.nix
        ./apps/nvim.nix
        ./apps/shell.nix
        ./apps/software.nix
        ./style/stylix.nix
        ./system/icons.nix
        ./system/xdgs.nix
        ./wm/hyprland/hyprland.nix
        ./wm/waybar/waybar.nix
        inputs.stylix.homeModules.stylix
    ];
}

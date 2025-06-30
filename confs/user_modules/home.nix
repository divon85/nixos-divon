{ pkgs, userSettings, inputs, ... }:
{
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    programs.home-manager.enable = true;

    imports = [
        ./apps/rofi/rofi.nix
        ./apps/starship/starship.nix
        ./apps/vscode/vscode.nix
        ./apps/yazi/yazi.nix
        ./apps/zsh/zsh.nix
        ./apps/nvim.nix
        ./apps/software.nix
        ./style/stylix.nix
        ./system/icons.nix
        ./system/xdgs.nix
        ./wm/hyprland/hyprland.nix
        ./wm/waybar/waybar.nix
        ./wm/wlogout/wlogout.nix
        inputs.stylix.homeModules.stylix
    ];

    home.stateVersion = "25.05";
}
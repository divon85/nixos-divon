{ inputs, pkgs, ... }:
{
    imports = [./extraConfigs/animation.nix];
    imports = [./extraConfigs/autostart.nix];
    imports = [./extraConfigs/binds.nix];
    imports = [./extraConfigs/decoration.nix];
    imports = [./extraConfigs/environment.nix];
    imports = [./extraConfigs/general.nix];
    imports = [./extraConfigs/gestures.nix];
    imports = [./extraConfigs/input.nix];
    imports = [./extraConfigs/layout.nix];
    imports = [./extraConfigs/misc.nix];
    imports = [./extraConfigs/monitor.nix];
    imports = [./extraConfigs/windowrules.nix];
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
}

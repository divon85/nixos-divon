{
    stylix.targets.yazi.enable = true;
    imports = [
        ./preview.nix
        ./settings.nix
        ./tasks.nix
    ];
    programs.yazi = {
        enable = true;
        enableZshIntegration = true;
    };
}
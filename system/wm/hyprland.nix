{ config, pkgs, ... }:

{
    imports = [
        ./dbus.nix
        ./fonts.nix
        ./gnome-keyring.nix
        ./pipewire.nix
    ];

    environment.systemPackages = with pkgs;
    [
        wayland waydroid
        (sddm-chili-theme.override {
            themeConfig = {
                background = config.stylix.image;
                ScreenWidth = 1366;
                ScreenHeight = 768;
                blur = true;
                recursiveBlurLoops = 3;
                recursiveBlurRadius = 5;
        };})
    ];

    # Configure xwayland
    services.xserver = {
        enable = true;
        xkb = {
            layout = "jp";
            variant = "";
            options = "caps:escape";
        };
        displayManager.sddm = {
            enable = true;
            wayland.enable = true;
            enableHidpi = true;
            theme = "chili";
            package = pkgs.sddm;
        };
    };
}

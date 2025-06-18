{ pkgs, ... }:
{
    # Enable stylix
    stylix = {
        enable = true;
        image = ./tiger.png;
        cursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
        };
        fonts = {
            monospace = {
                package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
                name = "JetBrainsMono Nerd Font Mono";
            };
            sansSerif = {
                package = pkgs.dejavu_fonts;
                name = "DejaVu Sans";
            };
            serif = {
                package = pkgs.dejavu_fonts;
                name = "DejaVu Serif";
            };
            sizes = {
                applications = 12;
                terminal = 15;
                desktop = 10;
                popups = 10;
            };
            opacity = {
                applications = 1.0;
                terminal = 0.8;
                desktop = 1.0;
                popups = 1.0;
            };
        };
    };
}
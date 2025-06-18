{ pkgs, ... }:
{
    gtk = {
        enable = true;
        cursorTheme = {
            package = pkgs.quintom-cursor-theme;
            name = "Quintom_Ink";
        };
    };
}
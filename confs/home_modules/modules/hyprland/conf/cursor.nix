{ pkgs, ... }:
{
    gtk.cursorTheme = {
        package = pkgs.quintom-cursor-theme;
        name = "Quintom_Ink";
    };
}
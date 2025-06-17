{ pkgs, ... }:
{
    home.packages = (with pkgs;[
        # Core
        zsh
        alacritty
        firefox
        git

        # Office
        evince
        # texliveFull

        # Media
        inkscape
        celluloid
        ffmpeg
    ]);
}
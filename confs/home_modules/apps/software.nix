{ pkgs, ... }:
{
    home.packages = with pkgs; [
        # Editor
        vscodium

        # Fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji
        font-awesome
        nerd-fonts.symbols-only
        fira-sans
        fira-code
        fira-code-symbols
        roboto
        liberation_ttf
        texlivePackages.japanese-otf
    ];
}
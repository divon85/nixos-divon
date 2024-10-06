{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    fira-code
    fira-sans
    font-awesome
    jetbrains-mono
    nerd-font-patcher
    nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    powerline-fonts
    powerline-symbols
    twemoji-color-font
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}

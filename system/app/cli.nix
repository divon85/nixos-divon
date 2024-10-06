{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
    eza
    brightnessctl
    cool-retro-term
    fastfetch
    ffmpeg
    git
    htop
    inputs.wezterm.packages.${pkgs.system}.default
    mediainfo
    nix-index
    ntfs3g
    starship
    unzip
    usbutils
    udiskie
    udisks
    wget
    zip
    zram-generator
  ];
}

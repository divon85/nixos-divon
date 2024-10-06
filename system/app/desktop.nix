{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty		# terminal
    audacity		# music player
    # evince		# pdf viewer
    imv			# image viewer
    # google-chrome	# browser
    mpv			# video player
    qutebrowser		# browser
    rofi-wayland	# launcher
    # texliveFull	# writing a scientific paper
    xfce.thunar		# file manager
    zathura		# pdf viewer
    # zoom-us		# online meeting
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };

    xfconf.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
	thunar-volman
      ];
    };
  };

  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };
}

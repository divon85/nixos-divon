{ pkgs, ... }: {
  home = {
    pointerCursor = {
      packages = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
	defaultCursor = true;
      };
    };
  };
}

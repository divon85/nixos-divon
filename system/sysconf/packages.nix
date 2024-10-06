{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "python-2.7.18.8" "electron-25.9.0" ];
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-sdk
    ];
  };
}

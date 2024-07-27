{ pkgs, ... }: {
  nixpkgs.config.retroarch = {
    enableMGBA = true;
    enableMAME = true;
    enableMesen = true;
  };
};

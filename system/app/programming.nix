{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    conda
    gnumake
    gcc
    nodejs
    julia-bin
    python
    (python3.withPackages (ps: with ps; [ requests ]))
    ripgrep
    pandoc
  ];
}

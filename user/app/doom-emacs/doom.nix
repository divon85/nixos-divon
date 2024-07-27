{
  programs.doom-emacs = {
    enable = true;
    emacsPackage = pkgs-emacs.emacs29-pgtk;
    doomPrivateDir = ./.;
    doomPackageDir = let
      filteredPath = builtins.path {
        path = ./.;
        name = "doom-private-dir-filtered";
        filter = path: type:
        builtins.elem (baseNameOf path) [ "init.el" "packages.el" ];
      };
    in pkgs-emacs.linkFarm "doom-packages-dir" [
      {
        name = "init.el";
        path = "${filteredPath}/init.el";
      }
      {
        name = "packages.el";
        path = "${filteredPath}/packages.el";
      }
      {
        name = "config.el";
        path = pkgs-emacs.emptyFile;
      }
    ];
  };

  home.file.".emacs.d/themes/doom-stylix-theme.el".source = config.lib.stylix.colors {
    template = builtins.readFile ./themes/doom-stylix-theme.el.mustache;
    extension = ".el";
  };

  home.packages = (with pkgs-emacs; [
    nil
    nixfmt
    filewmctrl
    jshon
    aria
    hledger
    hunspell hunspellDicts.en_US-large
    (pkgs-emacs.mu.override { emacs = emacs29-pgtk; })
    emacsPackage.mu4e
    isync
    msmtp
    (python3.withPackages (p: with p; [
      pandas
      requests
      epc lxml
      pysocks
      pymupdf
      markdown
    ]))
  ]) ++ (with pkgs-stable; [
    nodejs
    nodePackages.mermaid-cli
  ]);

  services.mbsync = {
    enable = true;
    package = pkgs-stable.isync;
    frequency = "*:0/5";
  };
}

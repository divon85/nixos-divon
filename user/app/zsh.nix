{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      fastfetch --config examples/13
    '';

    shellAliases =
      let
        flakeDir = "~/.dotfiles";
      in {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}#system";
	      upd = "nix flake update ${flakeDir}";
	      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}#system";

      	hms = "home-manager switch --flake ${flakeDir}#user";

      	confc = "nvim ${flakeDir}/configurations/configuration.nix";
        confp = "nvim ${flakeDir}/configurations/packages.nix";
        ls = "eza -a --icons";
        ll = "eza -al --icons";
        lt = "eza -a --tree --level=1 --icons";
        wifi = "nmtui";
        doom = "~/.config/emacs/bin/doom";
      };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" ];
        theme = "blinks"; # blinks is also nice
    };
    # "fastfetch --config examples/13";
  };
}

{ pkgs, ... }:

{
  # programs.zsh.enable = true;

  users = {
    # defaultUserShell = pkgs.zsh;

    users.igor = {
      isNormalUser = true;
      description = "Igor Novid";
      extraGroups = [ "networkmanager" "wheel" "input" ];
      packages = with pkgs; [];
    };
  };
}

{ userSettings, pkgs, ... }:

{
  # Doas instead of sudo
  security.doas.enable = true;
  security.sudo.enable = true;
  security.doas.extraRules = [{
    users = [ "${userSettings.username}" ];
    keepEnv = true;
    persist = true;
  }];

  environment.systemPackages = [
    (pkgs.writeScriptBin "sudo" ''exec doas "$@"'')
  ];
}

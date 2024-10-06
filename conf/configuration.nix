{ pkgs, lib, options, systemSettings, userSettings, ... }: {
  
  imports = [
    ../system/bundle.nix
  ];

  # User account
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "input" "dialout" ];
    packages = [];
    uid = 1000;
  };

  system.stateVersion = "24.05";
}

{ pkgs, lib, options, systemSettings, userSettings, ... }: {
    imports = [
        ../system/bundle.nix
    ];

    # User account
    users.users.${userSettings.username} = {
        isNormalUser = true;
        description = userSettings.name;
        extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
        shell = pkgs.zsh;
        packages = [];
    };

    system.stateVersion = "25.05";
}
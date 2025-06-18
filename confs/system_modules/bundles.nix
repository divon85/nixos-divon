{ lib, inputs, userSettings, pkgs, ... }:
let
    themePath = "../../themes/"+userSettings.theme+"/"+userSettings.theme+".yaml";
    themePolarity = lib.removeSuffix "\n" (builtins.readFile ("../../themes/"+userSettings.theme+"/polarity.txt"));
    myLightDMTheme = if themePolarity == "light" then "Adwaita" else "Adwaita-dark";
    backgroundUrl = builtins.readFile ("../../themes/"+userSettings.theme+"/backgroundurl.txt");
    backgroundSha256 = builtins.readFile ("../../themes/"+userSettings.theme+"/backgroundsha256.txt");

in
{
    imports = [
        ./apps/software.nix
        ./apps/thunar.nix
        ./systems/bootloader.nix
        ./systems/networking.nix
        ./systems/services.nix
        ./systems/timezone.nix
        ./wm/hyprland.nix
        inputs.home-manager.nixosModules.default
        inputs.vscode-server.nixosModules.default
        # inputs.stylix.nixosModules.stylix
    ];

    # User account
    users.users.${userSettings.username} = {
        isNormalUser = true;
        description = userSettings.name;
        extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
        shell = pkgs.zsh;
        packages = [];
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?

    # Enable Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # stylix.autoEnable = false;
    # stylix.polarity = themePolarity;
    # stylix.image = pkgs.fetchurl {
    #     url = backgroundUrl;
    #     sha256 = backgroundSha256;
    # };
    # stylix.base16Scheme = ./. + themePath;
    # stylix.fonts = {
    #     monospace = {
    #         name = userSettings.font;
    #         package = userSettings.fontPkg;
    #     };
    #     serif = {
    #         name = userSettings.font;
    #         package = userSettings.fontPkg;
    #     };
    #     sansSerif = {
    #         name = userSettings.font;
    #         package = userSettings.fontPkg;
    #     };
    #     emoji = {
    #         name = "Noto Color Emoji";
    #         package = pkgs.noto-fonts-emoji-blob-bin;
    #     };
    # };

    # stylix.targets.lightdm.enable = true;
    # services.xserver.displayManager.lightdm = {
    #     greeters.slick.enable = true;
    #     greeters.slick.theme.name = myLightDMTheme;
    # };
    # stylix.targets.console.enable = true;

    # environment.sessionVariables = {
    #     QT_QPA_PLATFORMTHEME = "qt5ct";
    # };
}
{ inputs, pkgs, lib, options, systemSettings, userSettings, ... }: {
    imports = [
        ./hardware-configuration.nix
        ./system_modules/bundles.nix
    ];
}

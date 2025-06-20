{ userSettings, ... }:
{
    # Automatic updating
    system.autoUpgrade = {
        enable = true;
        dates = "monthly";
        flake = inputs.self.outPath;
        flags = [
            "--update-input"
            "nixpkgs"
            "-L" #print build logs
        ];
        randomizeDelaySec = "45min";
    };

    # Automatic cleanup
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
    };
    nix.settings.auto-optimise-store = true;
}
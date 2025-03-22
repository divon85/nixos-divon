{ pkgs, ... }:
{
    home.packages = (with pkgs; [
        airshipper
        # tlauncher #! for minecraft, check the compatibility first !!!
    ]);

    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
    };
}
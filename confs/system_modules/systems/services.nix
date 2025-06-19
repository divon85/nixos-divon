{ pkgs, ... }:
{
    services = {
        # Enable CUPS to print documents
        printing.enable = true;

        # Enable the OpenSSH daemon
        openssh.enable = true;

        # Enable vscode-server
        vscode-server.enable = true;

        # keyring
        gnome.gnome-keyring.enable = true;

        # enable trash
        gvfs.enable = true;

        # login
        # xserver = {
        #         displayManager.sddm = {
        #         enable = true;
        #         wayland.enable = true;
        #         enableHidpi = true;
        #         theme = "chili";
        #         package = pkgs.sddm;
        #         excludePackages = [ pkgs.xterm ];
        #         xkb = {
        #             layout = "jp";
        #             variant = "";
        #             options = "caps:escape";
        #         };
        #     };
        # };

        dbus = {
            enable = true;
            packages = [ pkgs.dconf ];
        };

        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
        };

        xserver = {
            xkg = {
                layout = "jp106";
                xkbVariant = "";
                xkbOptions = "caps:escape";
            }
        }
    };

    # Enable bluetooth
    hardware.bluetooth.enable = true;
}
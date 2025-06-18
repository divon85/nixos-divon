{
    # Enable CUPS to print documents
    services.printing.enable = true;

    # Enable bluetooth
    hardware.bluetooth.enable = true;

    # Enable the OpenSSH daemon
    services.openssh.enable = true;

    # Enable vscode-server
    services.vscode-server.enable = true;

    # keyring
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.gdm-password.enableGnomeKeyring = true;

    # enable trash
    services.gvfs.enable = true;
}

{ systemSettings, ... }: {
  # Bootloader
  # Use systemd-boot if uefi, default to grub otherwise
  boot.loader = {
    systemd-boot.enable = if (systemSettings.bootMode == "uefi") then true else false;
    efi = {
      canTouchEfiVariables = if (systemSettings.bootMode == "uefi") then true else false;
      efiSysMountPoint = systemSettings.bootMountPath;
    };
    grub = {
      enable = if (systemSettings.bootMode == "uefi") then false else true;
      device = systemSettings.grubDevice;
    };
  };
}
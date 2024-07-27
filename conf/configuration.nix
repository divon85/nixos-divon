{ pkgs, lib, systemSettings, userSettings, ... }: {
  imports = [
    ../system/bundle.nix
  ];

  disabledModules = [
    ../system/sysconf/xserver.nix
  ];

  # Ensure nix flakes are enabled
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;

  # Bootloader
  # Use systemd-boot if uefi, default to grub otherwise
  boot.loader = {
    systemd-boot.enable = if (systemSettings.bootMode == "uefi") then true else false;
    efi = {
      canTouchEfiVariables = if (systemSettings.bootMode == "uefi") then true else false;
      efiSysMountPoint = systemSettings.bootMountPath; # does nothing if running bios rather than uefi
    };
    grub = {
      enable = if (systemSettings.bootMode == "uefi") then false else true;
      device = systemSettings.grubDevice; # does nothing if running uefi rather than bios
    };
  };
  
  # Networking
  networking = {
    hostName = systemSettings.hostname; # Define your hostname.
    networkmanager.enable = true; # Use networkmanager
    timeServers = options.networking.timeServers.default ++ [ "ntp.example.com" ];
  };

  # Timezone and locale
  time.timeZone = systemSettings.timezone; # time zone
  i18n.defaultLocale = systemSettings.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };
  
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

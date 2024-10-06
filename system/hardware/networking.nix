{ systemSettings, ... }: {
  # Networking
  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
    timeServers = options.networking.timeServers.default ++ [ "ntp.example.com" ];
  };
}
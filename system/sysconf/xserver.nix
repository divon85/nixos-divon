{
  services.xserver = {
    enable = true;
    windowManager.herbstluftwm.enable = true;

    layout = "jp";
    xkbVariant = "";

    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };

    videoDrivers = [ "intel" ];
    deviceSection = ''Option "TearFree" "True"'';
  };
}

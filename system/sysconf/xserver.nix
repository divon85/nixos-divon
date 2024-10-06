# {
  # services.xserver = {
    # enable = true;
    # windowManager.herbstluftwm.enable = true;

    # xkb.layout = "jp";
    # xkb.variant = "";

    # libinput = {
      # enable = true;
      # mouse.accelProfile = "flat";
      # touchpad.accelProfile = "flat";
    # };

    # videoDrivers = [ "intel" ];
    # deviceSection = ''Option "Tearfree" "True"'';
  # };
# }

{
  services = {
    xserver = {
      enable = true;
      # windowManager.herbstluftwm.enable = true;

      xkb = {
        layout = "us";
	variant = "";
      };

      videoDrivers = [ "intel" ];
      deviceSection = ''Option "Tearfree" "True"'';
    };
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };
  };
}

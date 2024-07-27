{
  programs.wlogout = {
    enable = true;
    layout = [
      # {
      #   label = "lock";
      #   action = "$HOME/.dotfiles/home-manager/modules/wms/scripts/power.sh lock";
      #   text = "Lock";
      #   keybind = "l";
      # } 
      # {
      #  label = "hibernate";
      #   action = "$HOME/.dotfiles/home-manager/modules/wms/scripts/power.sh hibernate";
      #   text = "Hibernate";
      #   keybind = "h";
      # }
      # {
      #   label = "logout";
      #   action = "$HOME/.dotfiles/home-manager/modules/wms/scripts/power.sh exit";
      #   text = "Exit";
      #   keybind = "e";
      # }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = ''
      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border: 3px solid #FFFFFF;
        background-color: rgba(12, 12, 12, 0.3);
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      }
      #lock {
        margin: 10px;
        border-radius: 20px;
        background-image: url("./icons/lock.png"));
      }
      #logout {
        margin: 10px;
        border-radius: 20px;
        background-image: url("./icons/logout.png"));
      }
      #suspend {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("$HOME/.dotfiles/user/wm/icons/suspend.png")));
      }
      #hibernate {
        margin: 10px;
        border-radius: 20px;
        background-image: url("./icons/hibernate.png"));
      }
      #shutdown {
        margin: 10px;
        border-radius: 20px;
        background-image: url("./icons/shutdown.png");
      }
      #reboot {
        margin: 10px;
        border-radius: 20px;
        background-image: url("./icons/reboot.png");
      }
    '';
  };
}

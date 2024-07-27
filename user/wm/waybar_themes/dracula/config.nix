{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        spacing = 4;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-right = [
          "pulseaudio"
          "bluetooth"
          "battery"
          "network"
          "group/hardware"
          "tray"
          # "custom/exit"
          "clock"
        ];

        "hyprland/workspaces" = {
          # on-click = "activate";
          # active-only = false;
          # all-outputs = true;
          # format = "{}";
          disable-scroll = true;
        };

        "hyprland/window" = {
          separate-outputs = true;
        };

        "pulseaudio" = {
          format = "{icon}  {volume}%";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
          min-length = 13;
        };
        "bluetooth" = {
          format = " {status}";
          format-disabled = "";
          format-off = "";
          interval = 30;
          # on-click = "blueman-manager";
          format-no-controller = "";
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}   {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-alt = "{icon}  {time}";
          format-icons = [" " " " " " " " " "];
        };
        "network" = {
          format = "{ifname}";
          format-wifi = "   {signalStrength}%";
          format-ethernet = "  {ifname}";
          format-disconnected = "Disconnected";
          tooltip-format = " {ifname} via {gwaddri}";
          tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
          tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };
        "custom/system" = {
          format = "";
          tooltip = false;
        };
        "cpu" = {
          format = "/ C {usage}% ";
          # on-click = "alacritty -e htop";
        };
        "memory" = {
          format = "/ M {}% ";
          # on-click = "alacritty -e htop";
        };
        "disk" = {
          interval = 30;
          format = "D {percentage_used}% ";
          path = "/";
          # on-click = "alacritty -e htop";
        };
        "group/hardware" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "not-memory";
            transition-left-to-right = false;
          };
          modules = [
            "custom/system"
            "disk"
            "cpu"
            "memory"
          ];
        };
        "tray" = {
          icon-size = 21;
          spacing = 10;
        };
        "custom/exit" = {
          format = " ";
          # on-click = "wlogout";
          tooltip = false;
        };
        "clock" = {
          interval = 1;
          format = "{:%H:%M:%S %a}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
      };
    };
    style =
      ''
      @import url("./colors.css");
      * {
          border: none;
          border-radius: 0;
          font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
          font-size: 11pt;
          min-height: 0;
        }
        window#waybar {
          opacity: 0.9;
          background: @background-darker;
          color: @foreground;
          border-bottom: 2px solid @background;
        }
        #workspaces button {
          padding: 0 10px;
          background: @background;
          color: @foreground;
        }
        #workspaces button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
          background-image: linear-gradient(0deg, @selection, @background-darker);
        }
        #workspaces button.active {
          background-image: linear-gradient(0deg, @background-darker, @selection);
        }
        #workspaces button.urgent {
          background-image: linear-gradient(0deg, @red, @background-darker);
        }
        #taskbar button.active {
          background-image: linear-gradient(0deg, @selection, @background-darker);
        }
        #custom-exit {
          margin: 0px 20px 0px 0px;
          padding:0px;
          color: @iconcolor;
        }
      '';
  };
}

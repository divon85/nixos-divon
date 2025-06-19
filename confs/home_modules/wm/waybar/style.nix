{ config, pkgs, lib, ... }:
{
    programs.waybar = {
        style = ''
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
                border-botom: 2px solid @background;
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
                background-image: linear-gradient(0deg, @workspacesbackground2, @selection);
            }
            #workspaces button.urgent {
                background-image: linear-gradient(0deg, @red, @background-darker);
            }
            #taskbar button.active {
                background-image: linear-gradient(0deg, @selection, @background-darker);
            }
            #custom-exit {
                margin: 0px 20px 0px 0px;
                padding: 0px;
                color: @iconcolor;
            }
        '';
    };
}

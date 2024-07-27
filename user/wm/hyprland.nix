{ inputs, config, lib, pkgs, userSettings, systemSettings, ... }:
let
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
    size = 36;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprtrails
      inputs.hycov.packages.${pkgs.system}.hycov
      inputs.hyprgrass.packages.${pkgs.system}.default
    ];
    settings = {
      "$mainMod" = "SUPER";

      monitor = ",1366x768,auto,1";

      env = [
        "CLUTTER_BACKEND,wayland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "GDK_BACKEND,wayland,x11,*"
        "WLR_DRM_DEVICES,/dev/dri/card2:/dev/dri/card1"
        "XCURSOR_SIZE,24"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SCREENSHOTS_DIR,~/Pictures/screenshots"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "jp";
        kb_variant = "";
        kb_options = "";
        numlock_by_default = false;
	      follow_mouse = 1;
	      touchpad = {
	        natural_scroll = false;
	      };

	      sensitivity = 0; # -1.0 - 1.0, 0 means no modification
      };

      general = {
        gaps_in = 10;
	      gaps_out = 14;
	      border_size = 3;
	      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
	      "col.inactive_border" = "rgba(595959aa)";

	      layout = "dwindle";

	      # no_cursor_warps = false;
      };

      decoration = {
        rounding = 10;

	      blur = {
	        enabled = true;
	        size = 6;
	        passes = 2;
	        new_optimizations = true;
	      };

	      drop_shadow = true;
	      shadow_range = 4;
	      shadow_render_power = 3;
	      "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
	      animation = [
	        "windows, 1, 6, wind, slide"
	        "windowsIn, 1, 6, winIn, slide"
	        "windowsOut, 1, 5, winOut, slide"
	        "windowsMove, 1, 5, wind, slide"
	        "border, 1, 1, liner"
	        "borderangle, 1, 30, liner, loop"
	        "fade, 1, 10, default"
	        "workspaces, 1, 5, wind"
	      ];
      };

      dwindle = {
        pseudotile = true;
	      preserve_split = true;
      };

      master = {
        # new_is_master = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
      	animate_mouse_windowdragging = true;
      	enable_swallow = true;
      	render_ahead_of_time = false;
      	disable_hyprland_logo = true;
      };

      windowrule = [
        "fullscreen, ^{emacs}$"
      ];

      exec-once = [
        "waybar"
      	"wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "hyprpaper"
        "hyprctl"
      ];

      bind = [
        # Applications
        "$mainMod, Return, exec, alacritty"
      	"$mainMod, B, exec, qutebrowser"
      	"$mainMod CTRL, B, exec, google-chrome-stable"
      	"$mainMod, C, exec, emacs"
      	"$mainMod CTRL, C, exec, code"


        "$mainMod CTRL, Return, exec, rofi -show drun -replace -i"
      	"$mainMod CTRL, Q, exec, wlogout"

      	# Windows
      	"$mainMod, Q, killactive"
      	"$mainMod, E, exec, thunar"
        "$mainMod, F, fullscreen"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        # "$mainMod, mouse:272, movewindow"
        # "$mainMod, mouse:273, resizewindow"

      	# Workspaces
      	"$mainMod, 1, workspace, 1"
      	"$mainMod, 2, workspace, 2"
      	"$mainMod, 3, workspace, 3"
      	"$mainMod, 4, workspace, 4"
      	"$mainMod, 5, workspace, 5"
      	"$mainMod, 6, workspace, 6"
      	"$mainMod, 7, workspace, 7"
      	"$mainMod, 8, workspace, 8"
      	"$mainMod, 9, workspace, 9"
      	"$mainMod, 0, workspace, 10"
      	"$mainMod SHIFT, 1, movetoworkspace, 1"
      	"$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
      	"$mainMod SHIFT, 4, movetoworkspace, 4"
      	"$mainMod SHIFT, 5, movetoworkspace, 5"
      	"$mainMod SHIFT, 6, movetoworkspace, 6"
      	"$mainMod SHIFT, 7, movetoworkspace, 7"
      	"$mainMod SHIFT, 8, movetoworkspace, 8"
      	"$mainMod SHIFT, 9, movetoworkspace, 9"
      	"$mainMod SHIFT, 0, movetoworkspace, 10"

        # Fn keys
        ", XF86MonBrightnessUp, exec, brightnessctl -q s +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 10%-"
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };

    extraConfig = ''
      exec-once = hyprctl setcursor '' + config.gtk.cursorTheme.name + " " + builtins.toString config.gtk.cursorTheme.size + ''
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow
    '';
  };
}

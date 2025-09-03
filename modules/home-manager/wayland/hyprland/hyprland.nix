{ config, pkgs, ... }:

let
  isLatam = false;
  wallpaper = "oneshot.jpg";
in
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = [
        "eDP-1, 1920x1200@60, 0x0, 1.0"
      ];

      exec-once = [
        "hyprpaper"
	"hyprlock || hyprctl dispatch exit"
      ];

      # Animations
      animations = {
        enabled = true;
	bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
        animation = [
          "windows, 1, 5, myBezier"
          "border, 1, 10, default"
          "fade, 1, 5, default"
          "workspaces, 1, 3, default" # <-- workspace switch animation
        ];
        # duration is in tenths of ms steps (so lower = faster)
        # If "3" feels too slow, try "1" or "2"
      };

      workspace = [
        "1" "2" "3"
      ];

      # Input settings
      input = {
	kb_layout = if isLatam then "latam" else "us";
        repeat_delay = 200;
	repeat_rate = 35;
	follow_mouse = 1; # focus windows under mouse
        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
	  scroll_factor = 1;
        };
        sensitivity = 0.7; # 0 = default
      };

      # General window management
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(9a59cf)";  # catppuccin-ish
        "col.inactive_border" = "rgba(1e1e2eee)";
      };

      # Keybindings
      bind = [
        "SUPER, RETURN, exec, kitty"   # Terminal
        "SUPER, R, exec, rofi -show drun" # App launcher
        "SUPER, W, killactive"            # Close window
        "SUPER SHIFT, E, exit"            # Exit Hyprland
        "SUPER, F, fullscreen"            # Toggle fullscreen
        # Workspaces
	"SUPER, LEFT, workspace, m-1"
	"SUPER, RIGHT, workspace, m+1"
	"SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
      ];
    };
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Dotfiles/wallpapers/${wallpaper}
    wallpaper = ,~/Dotfiles/wallpapers/${wallpaper}
  '';
}

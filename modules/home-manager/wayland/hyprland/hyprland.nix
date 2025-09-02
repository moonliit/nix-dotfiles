{ config, pkgs, ... }:

{
  # Enable Hyprland in Home Manager
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Set monitor resolution (replace HDMI-A-1 with your monitor name from `hyprctl monitors`)
      monitor = [
        "Monitor eDP-1, 1920x1200@60, 0x0, 1"
      ];

      # Input settings
      input = {
        kb_layout = "us"; # change if you need another keyboard layout
        follow_mouse = 1; # focus windows under mouse
        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
        };
        sensitivity = 0; # 0 = default
      };

      # General window management
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(89b4faee)";  # catppuccin-ish
        "col.inactive_border" = "rgba(1e1e2eee)";
      };

      # Keybindings
      bind = [
        "SUPER, RETURN, exec, kitty"   # Terminal
        "SUPER, D, exec, rofi -show drun" # App launcher
        "SUPER, Q, killactive"            # Close window
        "SUPER SHIFT, E, exit"            # Exit Hyprland
        "SUPER, F, fullscreen"            # Toggle fullscreen
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
      ];
    };
  };
}

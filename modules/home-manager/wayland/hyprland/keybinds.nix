{ pkgs, ... }:

[
  "SUPER, RETURN, exec, kitty" # Terminal
  "SUPER, R, exec, rofi -show drun -show-icons" # App launcher
  "SUPER, TAB, cyclenext" # Window switch
  "SUPER, W, killactive" # Close window
  "SUPER, F, fullscreen" # Toggle fullscreen
  "SUPER SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy" # Screenshot
  ", XF86AudioRaiseVolume, exec, pamixer -i 5"
  ", XF86AudioLowerVolume, exec, pamixer -d 5"
  ", XF86AudioMute, exec, pamixer -t"
  # Workspaces
  "SUPER, LEFT, workspace, m-1"
  "SUPER, RIGHT, workspace, m+1"
  "SUPER, 1, workspace, 1"
  "SUPER, 2, workspace, 2"
  "SUPER, 3, workspace, 3"
  "SUPER SHIFT, 1, movetoworkspace, 1"
  "SUPER SHIFT, 2, movetoworkspace, 2"
  "SUPER SHIFT, 3, movetoworkspace, 3"
]

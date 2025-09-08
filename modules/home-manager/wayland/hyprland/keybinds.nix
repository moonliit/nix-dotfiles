{ pkgs, ... }:

[
  "SUPER, RETURN, exec, kitty" # Terminal
  "SUPER, R, exec, rofi -show drun -show-icons" # App launcher
  "SUPER, TAB, cyclenext" # Window switch
  "SUPER, W, killactive" # Close window
  "SUPER, F, fullscreen" # Toggle fullscreen
  "SUPER SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy" # Screenshot
  ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise" # Raise volume
  ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower" # Lower volume
  ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle" # Toggle mute
  ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise" # Brightness up
  ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower" # Brightness down
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

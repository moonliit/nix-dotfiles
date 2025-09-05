[
  "SUPER, RETURN, exec, kitty"       # Terminal
  "SUPER, R, exec, rofi -show drun"  # App launcher
  "SUPER, TAB, exec, rofi -show run" # Window switch
  "SUPER, W, killactive"             # Close window
  "SUPER, F, fullscreen"             # Toggle fullscreen
  "SUPER SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy" # Screenshot
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

{ pkgs, ... }:

let
  lib = pkgs.lib;
  numWorkspaces = 9;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
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

      # Switch between adyacent workspaces
      "SUPER, LEFT, workspace, m-1"
      "SUPER, RIGHT, workspace, m+1"

      # Change focus between windows
      "SUPER, h, movefocus, l"
      "SUPER, l, movefocus, r"
      "SUPER, k, movefocus, u"
      "SUPER, j, movefocus, d"

      # Swap current window with another
      "SUPER+SHIFT, h, swapwindow, l"
      "SUPER+SHIFT, l, swapwindow, r"
      "SUPER+SHIFT, k, swapwindow, u"
      "SUPER+SHIFT, j, swapwindow, d"

      # Resize active window (shrink/grow in tiling)
      "SUPER+CTRL, h, resizeactive, -50 0"
      "SUPER+CTRL, l, resizeactive, 50 0"
      "SUPER+CTRL, k, resizeactive, 0 -50"
      "SUPER+CTRL, j, resizeactive, 0 50"
    ]

      # Move to a specific workspace
    ++ (lib.concatMap (n: [
      ("SUPER, ${toString n}, workspace, ${toString n}")
      ("SUPER SHIFT, ${toString n}, movetoworkspace, ${toString n}")
    ]) (lib.range 1 numWorkspaces));

    # Define workspaces
    workspace = (lib.concatMap (n: [
      (toString n)
    ]) (lib.range 1 numWorkspaces));
  };
}

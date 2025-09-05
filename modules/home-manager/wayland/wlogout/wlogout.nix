{ config, pkgs, ... }:

{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "Suspend";
        action = "${pkgs.hyprlock}/bin/hyprlock & systemctl suspend";
        text = "Suspend";
        keybind = "s";
      }
      {
        label = "Lock";
        action = "${pkgs.hyprlock}/bin/hyprlock";
        text = "Lock";
        keybind = "l";
      }
    ];
  };
}

{ config, pkgs, ... }:

{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
      }
    ];

    style = import ./style.css;
  };
}

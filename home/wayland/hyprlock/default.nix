{ config, pkgs, ... }:

let
  background = "oneshot-navigate.jpg";
  avatar = "shift.jpg";
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      # Background with blur
      background = [
        {
          monitor = "";
          path = "~/Dotfiles/wallpapers/${background}";
          blur_passes = 2;
          blur_size = 7;
          noise = 0.01;
        }
      ];

      # Time label
      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(242,243,244,0.9)";
          font_size = 80;
          font_family = "JetBrains Mono";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] date +"%a, %d %b %Y"'';
          color = "rgba(242,243,244,0.75)";
          font_size = 24;
          font_family = "JetBrains Mono";
          position = "0, 140";
          halign = "center";
          valign = "center";
        }
      ];

      # User avatar
      image = {
        monitor = "";
        path = "~/Dotfiles/avatars/${avatar}";
        size = 128;
        position = "0, 40";
        halign = "center";
        valign = "center";
      };

      # Password input
      input-field = {
        monitor = "";
        size = "220, 50";
        outline_thickness = 2;
        inner_color = "rgba(0,0,0,0.4)";
        outer_color = "rgba(255,255,255,0.2)";
        font_color = "rgb(255,255,255)";
        placeholder_text = ''<i><span foreground="##cccccc">Enter password...</span></i>'';
        rounding = 8;
        position = "0, -100";
        halign = "center";
        valign = "center";
      };

      general = {
        auth_method = "pam";
      };
    };
  };
}

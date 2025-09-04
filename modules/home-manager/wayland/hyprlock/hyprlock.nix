{ config, pkgs, ... }:

let
  wallpaper = "ena.jpg";
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      # Background image (optional, can also be a solid color)
      general = {
        background = "~/Dotfiles/wallpapers/${wallpaper}";
        blur_size = 4;
        blur_passes = 3;
        dim_strength = 0.4;
      };

      # Input field
      input-field = {
        size = "250, 50";
        position = "0, -100";
        rounding = 12;
        inner_color = "rgba(30, 30, 46, 0.8)";
        outer_color = "rgba(0, 0, 0, 0.8)";
        font_color  = "rgba(255, 255, 255, 1.0)";
      };

      # Clock example
      label = {
        text = "cmd[update:1000] date '+%H:%M'";
        position = "0, -200";
        font_size = 48;
        font_color = "rgba(255, 255, 255, 1.0)";
      };

      # User info
      user = {
        show_avatar = true;
        font_size = 20;
        position = "0, 150";
        font_color = "rgba(255, 255, 255, 1.0)";
      };
    };
  };
}

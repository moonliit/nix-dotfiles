{ config, pkgs, ... }:

let
  rofiTheme = "rounded-purple-dark.rasi";
in
{
  programs.rofi = {
    enable = true;
    theme = "~/Dotfiles/modules/home-manager/tools/rofi/themes/${rofiTheme}";
  };
}

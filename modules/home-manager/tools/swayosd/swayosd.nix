{ config, pkgs, ... }:

{
  services.swayosd = {
    enable = true;
    stylePath = "/home/moonliit/Dotfiles/modules/home-manager/tools/swayosd/style.css";
  };
  xdg.configFile."swayosd/themes/theme.css".source = ./style.css;
}

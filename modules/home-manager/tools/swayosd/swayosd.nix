{ config, pkgs, ... }:

{
  services.swayosd = {
    enable = true;
    stylePath = "~/Dotfiles/modules/home-manager/tools/swayosd/style.css"; 
  };
}

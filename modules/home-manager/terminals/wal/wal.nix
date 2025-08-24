{ config, pkgs, ... }:

let
  colors = builtins.fromJSON (builtins.readFile ./colors.json);
in
{
  programs.zsh.initContent = ''
    ~/Dotfiles/modules/home-manager/terminals/wal/apply.sh
  '';

  programs.kitty.settings = {
    background = colors.special.background;
    foreground = colors.special.foreground;
  };
}


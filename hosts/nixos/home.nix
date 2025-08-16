{ config, pkgs, ... }:

{
  home.username = "moonliit";
  home.homeDirectory = "/home/moonliit";
  home.stateVersion = "25.05";

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Dotfiles";
    };
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.75;
      font_size = 12;
      font_family = "0xProtoNerdFontMono";
      window_padding_width = 10;
    };
  };
}

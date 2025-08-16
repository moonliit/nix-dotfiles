# zsh.nix
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Dotfiles";
    };
  };
}


# zsh.nix
{ config, pkgs, ... }:

{
  programs.zsh = {
    enableCompletion = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Dotfiles";
    };
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "jnrowe";
    plugins = [
      "git"
      "docker"
    ];
  };
}


# zsh.nix
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellGlobalAliases = {
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


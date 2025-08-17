# zsh.nix
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    
    shellAliases = {
      # browse
      # hyfetch
      rebuild = "sudo nixos-rebuild switch --flake ~/Dotfiles";
    };

    initExtra = ''
      neowofetch
    '';
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "jnrowe";
    plugins = [
      "git"
      "bundler"
      "dotenv"
      "docker"
      "macos"
      "rake"
      "rbenv"
      "ruby"
    ];
  };
}


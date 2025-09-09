# zsh.nix
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    
    shellAliases = {
      # browse
      rebuild = "sudo nixos-rebuild switch --flake ~/Dotfiles";
      collect = "sudo nix-collect-garbage -d";
    };

    initContent = ''
      hyfetch
      eval "$(zoxide init zsh)"
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


# zsh.nix
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Dotfiles";
      switch = "home-manager switch --flake ~/Dotfiles";
      collect = "sudo nix-collect-garbage -d";
    };

    plugins = [
      {
        name = "zsh-autocomplete";
        src = pkgs.zsh-autocomplete;
      }
    ];

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

{ config, pkgs, ... }:

{
  home.username = "moonliit";
  home.homeDirectory = "/home/moonliit";
  home.stateVersion = "25.05";

  imports = [
    # terminals
    ./terminals/kitty/kitty.nix
    ./terminals/zsh/zsh.nix
    ./terminals/starship/starship.nix
  ];
}

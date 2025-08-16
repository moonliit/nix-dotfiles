{ config, pkgs, ... }:

{
  home.username = "moonliit";
  home.homeDirectory = "/home/moonliit";
  home.stateVersion = "25.05";

  imports = [
    import ./terminals/kitty.nix
    import ./terminals/zsh.nix
  ];
}

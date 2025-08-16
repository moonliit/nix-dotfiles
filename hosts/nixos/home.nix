{ config, pkgs, ... }:

let
  terminalsDir = "${NIXOS_MODULES_DIR}/home-manager/terminals";
in
{
  home.username = "moonliit";
  home.homeDirectory = "/home/moonliit";
  home.stateVersion = "25.05";

  imports = [
    "${terminalsDir}/kitty.nix"
    "${terminalsDir}/zsh.nix"
  ];
}

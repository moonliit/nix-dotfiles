{ config, pkgs, ... }:

let
  colors = "~/Dotfiles/modules/home-manager/terminals/wal"
in
{
  programs.zsh.initExtra = ''
    (cat ${colors} &)
  '';
}

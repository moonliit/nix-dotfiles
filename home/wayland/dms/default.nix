{ config, pkgs, pkgs-unstable, ... }:

{
  programs.dankMaterialShell = {
    enable = true;
    quickshell.package = pkgs-unstable.quickshell;
  };
}

{ config, pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    #pkgs-unstable.quickshell
  ];

  /*programs.dankMaterialShell = {
    enable = true;
    quickshell.package = pkgs-unstable.quickshell;
  };
  */
}

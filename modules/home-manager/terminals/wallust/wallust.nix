{ config, pkgs, ... }:

{
  programs.wallust = {
    enable = true;
    settings = pkgs.lib.importTOML ./wallust.toml;
  };
}

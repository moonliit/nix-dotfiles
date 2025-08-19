{ lib, config, pkgs, ... }:

let
in
{
  programs.fastfetch = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./config.jsonc);
  };
}


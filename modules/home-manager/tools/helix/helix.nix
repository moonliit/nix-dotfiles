{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "nonbinary-dark";
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
  };
  xdg.configFile."helix/themes/nonbinary-dark.toml".text = builtins.readFile ./themes/nonbinary-dark.toml;
}

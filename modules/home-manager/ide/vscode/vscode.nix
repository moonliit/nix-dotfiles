{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-vscode.cpptools
        rust-lang.rust-analyzer
      ];
      userSettings = {};
    };
  };
  # symlink
  xdg.configFile."Code/User/settings.json".source = ./settings.jsonc;
}

{ config, pkgs, ... }:

let
  customExtensions = import ./extensions.nix { inherit pkgs; };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-vscode.cpptools
        rust-lang.rust-analyzer

	# Themes
        zhuangtongfa.material-theme
	pkief.material-icon-theme
        customExtensions.prideTheme
      ];
      userSettings = {};
    };
  };
  # symlink
  xdg.configFile."Code/User/settings.json".source = ./settings.jsonc;
}

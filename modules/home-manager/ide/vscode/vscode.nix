{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    extensions = with pgs.vscode-extensions; [
     ms-python.python
     ms-vscode.cpptools
     rust-lang.rust-analyzer
    ];
  };
}

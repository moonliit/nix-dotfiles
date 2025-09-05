{ config, pkgs, ... }:

{
  home.username = "moonliit";
  home.homeDirectory = "/home/moonliit";
  home.stateVersion = "25.05";

  imports = [
    # terminals
    ./terminals/kitty/kitty.nix
    ./terminals/zsh/zsh.nix
    ./terminals/starship/starship.nix
    ./terminals/fastfetch/fastfetch.nix
    ./terminals/hyfetch/hyfetch.nix
    ./terminals/wal/wal.nix
    # IDEs
    ./ide/vscode/vscode.nix
    # wayland
    ./wayland/hyprland/hyprland.nix
    ./wayland/hyprlock/hyprlock.nix
    ./wayland/waybar/waybar.nix
    ./wayland/wlogout/wlogout.nix
    # tools
    ./tools/rofi/rofi.nix
  ];
}

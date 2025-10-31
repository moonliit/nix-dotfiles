{ config, pkgs, inputs, ... }:

let
  username = "moonliit";
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;

  imports = [
    # terminals
    ./terminals/kitty/
    ./terminals/zsh/
    ./terminals/starship/
    ./terminals/fastfetch/
    ./terminals/hyfetch/
    ./terminals/wal/
    ./terminals/nixowos/
    # wayland
    ./wayland/hyprland/
    ./wayland/hyprlock/
    ./wayland/hypridle/
    ./wayland/waybar/
    ./wayland/wlogout/
    ./wayland/swaync/
    # tools
    ./tools/wofi/
    ./tools/swayosd/
    ./tools/helix/
    ./tools/nixvim/
    ./tools/yazi/
    # apps
    ./apps/vscode/
    ./apps/nixcord/
    ./apps/librewolf/
    ./apps/zen-browser/
  ];
}

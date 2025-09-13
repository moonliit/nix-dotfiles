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
    ./terminals/nixowos/nixowos.nix
    # wayland
    ./wayland/hyprland/hyprland.nix
    ./wayland/hyprlock/hyprlock.nix
    ./wayland/hypridle/hypridle.nix
    ./wayland/waybar/waybar.nix
    ./wayland/wlogout/wlogout.nix
    # tools
    ./tools/rofi/rofi.nix
    ./tools/swayosd/swayosd.nix
    ./tools/helix/helix.nix
    ./tools/neovim/neovim.nix
    # apps
    ./apps/vscode/vscode.nix
    ./apps/nixcord/nixcord.nix
    ./apps/librewolf/librewolf.nix
    ./apps/chromium/chromium.nix
  ];
}

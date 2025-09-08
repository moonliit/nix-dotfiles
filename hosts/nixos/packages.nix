{ pkgs }:

with pkgs; [
  vim
  wget
  neovim
  kitty
  btop
  gedit
  bat
  git
  fastfetch
  hyfetch
  starship
  pywal
  zsh
  oh-my-zsh
  pcmanfm
  rofi-wayland
  gh
  jq
  (discord.override { withVencord = true; })
  docker
  zoom-us
  vscode-fhs
  python312
  gcc
  gdb
  clang
  cmake
  ninja
  rustc
  rustup
  cargo
  rust-analyzer
  pavucontrol
  helvum
  pamixer
  qpwgraph
  playerctl
  brightnessctl
  acpi
  waybar
  grim slurp # screenshots
  wl-clipboard
  hyprlock
  hyprpaper
  wlogout
  wev
  yazi fzf
  iwd impala
  swayosd
]

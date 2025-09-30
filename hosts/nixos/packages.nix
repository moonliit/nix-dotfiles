{ pkgs }:

with pkgs;

let
  # Editors / IDEs
  editors = [
    vim
    helix
    vscode-fhs
    gedit
  ];

  # Terminal & shells
  terminals_and_shells = [
    kitty
    zsh
    oh-my-zsh
    tmux
  ];

  # Compilers, build tools, debuggers
  build_tools = [
    gcc
    gdb
    clang
    cmake
    gnumake
    ninja
  ];

  # Languages & tooling
  languages = [
    python312
    rustc rustup cargo
    jdk
    mpich
  ];

  # Language servers
  lsps = [
    nil
    rust-analyzer
    lua-language-server
  ];

  # Dev utils
  dev_utils = [
    nix-prefetch-git
    wget
    git gh gitui
  ];

  # CLI utilities
  cli_tools = [
    ripgrep
    fd
    bat
    jq
    fzf
    yazi
    tree-sitter
    unzip
  ];

  # Productivity / shell niceties
  productivity = [
    starship
    pywal
    zoxide
    cliphist
    wl-clipboard
  ];

  # Multimedia / audio
  multimedia = [
    mpv
    cava
    pavucontrol
    helvum
    pamixer
    qpwgraph
    playerctl
    grim slurp
  ];

  # Communication
  communication = [
    discord
    zapzap
    zoom-us
  ];

  # Wayland / desktop tools
  wayland_and_ui = [
    waybar
    hyprlock
    hyprpaper
    hypridle
    hyprpicker
    wlogout
    wev
    swaynotificationcenter
    swayosd
    rofi-wayland
    iwd impala
  ];

  # System utilities
  system_utils = [
    fastfetch hyfetch
    btop
    brightnessctl
    acpi
    tty-clock
    nur.repos.charmbracelet.crush
  ];

  # Docs & office
  docs_and_office = [
    libreoffice
    xournalpp
    obsidian
    texlive.combined.scheme-full
  ];

  # Containers
  containers = [
    docker
  ];

in
  editors
  ++ terminals_and_shells
  ++ build_tools
  ++ languages
  ++ dev_utils
  ++ cli_tools
  ++ productivity
  ++ multimedia
  ++ communication
  ++ wayland_and_ui
  ++ system_utils
  ++ docs_and_office
  ++ containers

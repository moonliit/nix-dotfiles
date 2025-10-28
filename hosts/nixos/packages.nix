{ pkgs }:
with pkgs;

let
  # Editors / IDEs
  editors = [
    vim
    helix
    vscode-fhs
    gedit
    arduino-ide
    eagle
  ];

  # Terminal & shells
  terminals_and_shells = [
    kitty
    zsh
    oh-my-zsh
    tmux
    home-manager
  ];

  # Compilers, build tools, debuggers
  build_tools = [
    gcc
    gdb
    clang
    cmake
    gnumake
    ninja
    mosquitto
  ];

  # Languages & tooling
  languages = [
    python312
    rustc rustup cargo
    jdk
    mpich
    openmpi
  ];

  # Language servers
  lsps = [
    nixd
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
    manix
  ];

  # Productivity / shell niceties
  productivity = [
    starship
    pywal
    zoxide
    cliphist
    wl-clipboard-rs
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
    hyprshot
    wlogout
    wev
    swaynotificationcenter
    swayosd
    dunst
    rofi-wayland
    iwd impala
    nwg-drawer
  ];

  # System utilities
  system_utils = [
    fastfetch hyfetch
    btop
    brightnessctl
    acpi
    tty-clock
    nur.repos.charmbracelet.crush
    nautilus
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

  # Browsers
  browsers = [
    firefox
    librewolf
    google-chrome
  ];

in
  editors ++
  terminals_and_shells ++
  build_tools ++
  languages ++
  lsps ++
  dev_utils ++
  cli_tools ++
  productivity ++
  multimedia ++
  communication ++
  wayland_and_ui ++
  system_utils ++
  docs_and_office ++
  containers ++
  browsers

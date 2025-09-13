{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  
    # Use nightly if you want latest features
    package = pkgs.neovim-unwrapped;

    extraPackages = with pkgs; [
      git
      nodejs
      ripgrep
      fd
    ];
  };

  home.file.".config/nvim".source = pkgs.fetchFromGitHub {
    owner = "nvim-lua";
    repo = "kickstart.nvim";
    rev = "3338d3920620861f8313a2745fd5d2be39f39534";
    sha256 = "0gs3c43f9liyf50a5ycdrzgfldn2rx24yfryr1qm8hfrnzrp97s7";
  };
}

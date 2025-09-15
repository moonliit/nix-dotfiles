{ config, pkgs, ... }:

{
  imports = [
    ./plugins/treesitter.nix
    ./plugins/lsp.nix
    ./plugins/lint.nix
    ./plugins/debug.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    waylandSupport = true;

    plugins = {
      indent-blankline.enable = true;
      telescope.enable = true;
      which-key.enable = true;
      web-devicons.enable = true;
    };

    plugins.lsp.servers = {
      nixd.enable = true;
    }; 

    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    clipboard.providers.wl-copy.enable = true;
    colorschemes.catppuccin.enable = true;
  };
}

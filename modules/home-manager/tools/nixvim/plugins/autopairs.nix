{
  # Inserts matching pairs of parens, brackets, etc.
  # https://nix-community.github.io/nixvim/plugins/nvim-autopairs/index.html
  plugins.nvim-autopairs = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings = {
        event = "InsertEnter";
      };
    };

    settings = {
      check_ts = true;
    };
  };
}

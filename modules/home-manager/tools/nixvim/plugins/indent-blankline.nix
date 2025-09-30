{
  plugins.indent-blankline = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings = {
        event = "BufReadPre";
      };
    };

    luaConfig.pre = ''
      -- turn off list symbols so you don't get >> / » markers
      vim.opt.list = false
      -- keep sane listchars if you still want to visualize trailing spaces (optional)
      vim.opt.listchars = { tab = "  ", trail = "·" }

      -- setup
      pcall(function()
	      require("ibl").setup({
		      char = "│",
		      show_trailing_blankline_indent = false,
		      show_first_indent_level = false,
		      use_treesitter = true,
		      show_current_context = false,
	      })
      end)
    '';
  };
}

{
  plugins.toggleterm = {
    enable = true;
    settings = {
      size = 15;
      direction = "horizontal";   # Bottom terminal
      shade_terminals = true;
      start_in_insert = true;
      persist_size = true;
      close_on_exit = true;
      open_mapping = "[[<C-/>]]";
    };

    luaConfig.post = ''
      -- prevent Neo-tree from stealing focus when a terminal opens
      vim.api.nvim_create_autocmd({ "WinEnter" }, {
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          if vim.bo[buf].buftype == "terminal" then
            -- do nothing; let terminal keep focus
            return
          end
        end,
        desc = "Avoid Neo-tree stealing focus on terminal open",
      })

    '';
  };
}

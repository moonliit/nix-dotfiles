{
  plugins.neo-tree = {
    enable = true;

    filesystem = {
      filteredItems = {
        visible = true;
      };
      window = {
        mappings = {
          "F" = "fuzzy_finder";
          "." = "set_root";
          "," = "navigate_up";
        };
      };
    };
  };

  keymaps = [
    {
      key = "<C-n>";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Neotree";
      };
    }
    {
      key = "<C-m>";
      action.__raw = ''
        function()
          local manager = require("neo-tree.sources.manager")
          local renderer = require("neo-tree.ui.renderer")

          -- Check if filesystem is open
          local state = manager.get_state("filesystem")
          local is_open = state and state.winid and vim.api.nvim_win_is_valid(state.winid)

          if is_open and vim.api.nvim_get_current_win() == state.winid then
            -- If FS is focused, go back to main editor
            vim.cmd("wincmd p")
          else
            -- If FS not focused (or not open), open and focus it
            vim.cmd("Neotree focus filesystem")
          end
        end
      '';
      options = {
        noremap = true;
        silent = true;
        desc = "Switch focus beween Neotree and editor";
      };
    }
  ];
}

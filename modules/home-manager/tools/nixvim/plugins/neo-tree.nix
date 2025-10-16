{
  plugins.neo-tree = {
    enable = true;
    settings = {
      filesystem = {
        filtered_items = {
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
      source_selector = {
        winbar = false;
      };
      hide_root_node = true;
      close_if_last_window = true;
      follow_current_file = {
        enabled = false;
      };
    };
  };

  highlight = {
    "NeoTreeNormal" = {
      bg = "#15151a";
      fg = "#cdd6f4";
    };
    "NeoTreeNormalNC" = {
      bg = "#15151a";
      fg = "#cdd6f4";
    };
    "WinSeparator" = {
      bg = "#2f1f31";
      fg = "#2f1f31";
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
  ];
}

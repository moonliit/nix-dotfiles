{ pkgs, ... }:

let
  lib = pkgs.lib;
in
{
  plugins.bufferline = {
    enable = true;

    luaConfig.pre = ''
      pcall(function()
	      require("bufferline").setup({
		      options = {
		        numbers = "ordinal",
      			diagnostics = "nvim_lsp",
      			show_buffer_close_icons = true,
      			show_close_icon = true,
		      	separator_style = "thin",
      			always_show_bufferline = true,
		      	enforce_regular_tabs = false,
			      indicator = { style = "icon", icon = "▎" },
		      },
	      })
      end)
    '';
  };

  keymaps = [
    # Ctrl-t -> create new tab
    {
      key = "<C-t>";
      mode = "n";
      # TODO: make it so that new tabs can be opened when in an empty new tab
      action = "<cmd> enew <CR>";
      options = { noremap = true; silent = true; desc = "New tab" ; };
    }

    # Ctrl-Tab -> switch between last two tabs
    {
      key = "<C-Tab>";
      mode = "n";
      action.__raw = ''
        function()
          -- TODO:
          vim.notify("TODO", vim.log.levels.INFO)
        end
      '';
      options = { noremap = true; silent = true; desc = "Toggle last two tabs" ; };
    }

    # Fallback for terminals that don't emit <C-Tab>: Leader-Tab toggles
    {
      key = "<leader><Tab>";
      mode = "n";
      action.__raw = ''
        function()
          -- TODO
          vim.notify("TODO", vim.log.levels.INFO)
        end
      '';
      options = { noremap = true; silent = true; desc = "Toggle last two tabs (fallback)"; };
    }

    # Ctrl-W -> close current tab (but skip neo-tree)
    {
      key = "<C-w>";
      mode = "n";
      # TODO: find a way to not make it laggy (?)
      action.__raw = ''
        function()
          local ft = vim.bo.filetype
          -- Neo-tree filetypes: 'neo-tree' or 'neo-tree-popup'
          if ft == "neo-tree" or ft == "neo-tree-popup" then
            vim.notify("Refusing to close Neo-tree with <C-w>", vim.log.levels.INFO)
            return
          end
          vim.cmd("bp|sp|bn|bd!")
        end
      '';
      options = { noremap = true; silent = true; nowait = true; desc = "Close current tab (skip neo-tree)"; };
    }
  ]
    # TODO: Ctrl-S to save current file in buffer

  # Ctrl-number mappings 1..9 (with literals embedded into the Lua body)
  ++ (lib.concatMap (n: [
    {
      key = "<C-" + toString n + ">";
      mode = "n";
      action.__raw = ''
        function()
          local bf = require("bufferline")
          local target = '' + toString n + ''
          bf.go_to(target, true)
        end
      '';
      options = { noremap = true; silent = true; desc = "Goto tab " + toString n ; };
    }
  ]) (lib.range 1 9));
}

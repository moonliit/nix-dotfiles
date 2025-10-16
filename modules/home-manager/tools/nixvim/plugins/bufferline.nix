{ pkgs, ... }:

let
  lib = pkgs.lib;
  selected = {
    bg = "#1e1e1e";
    fg = "#ffffff";
  };
  other = {
    bg = "#0f1014";
    fg = "#9b9ea4";
  };
in
{
  plugins.bufferline = {
    enable = true;

    settings = {
      options = {
        numbers = "ordinal";
        diagnostics = "nvim_lsp";
        show_buffer_close_icons = true;
        show_close_icon = true;
        separator_style = "thin";
        always_show_bufferline = true;
        enforce_regular_tabs = false;
        indicator = {
          style = "underline";
        };
        offsets = [
          {
            filetype = "neo-tree";
            highlight = "Directory";
            padding = 1;
          }
        ];
      };
      highlights = {
        background = {
          bg = other.bg;
          fg = other.fg;
        };
        buffer_selected = {
          fg = selected.fg;
          bg = selected.bg;
          sp = selected.fg;
        };
        tab_selected = {
          fg = selected.fg;
          bg = selected.bg;
        };
        separator_selected = {
          fg = selected.fg;
          bg = selected.bg;
        };
        fill = {
          bg = selected.bg;
        };
        numbers_selected = {
          fg = selected.fg;
          bg = selected.bg;
        };
        modified_selected = {
          fg = selected.fg;
          bg = selected.bg;
          sp = selected.fg;
          underline = true;
        };
        close_button_selected = {
          fg = selected.fg;
          bg = selected.bg;
        };
        indicator_selected = {
          fg = selected.fg;
          bg = selected.bg;
          sp = selected.fg;
        };
      };
    };

    luaConfig.post = ''
      -- lmao
    '';
  };

  keymaps = [
    # Alt-H -> switch to prev buffer
    {
      key = "<A-h>";
      mode = "n";
      action = "<cmd> BufferLineCyclePrev <cr>";
      options = { desc = "Prev Buffer"; };
    }

    # Alt-L -> switch to next buffer
    {
      key = "<A-l>";
      mode = "n";
      action = "<cmd> BufferLineCycleNext <cr>";
      options = { desc = "Next Buffer"; };
    }

    # Ctrl-T -> create new tab
    {
      key = "<C-t>";
      mode = "n";
      action.__raw = ''
        function()
          -- if currently in terminal mode, ignore
          if vim.api.nvim_get_mode().mode == "t" then
            return
          end

          local name = vim.api.nvim_buf_get_name(0)
          local ft = vim.bo.filetype

          -- only create new buffer if not in a floaterm context
          if not (ft == "floaterm" or name:match("term://.*floaterm") or vim.b.floaterm_index) then
            vim.cmd("enew")
          else
            vim.notify("In Floaterm — skipping :enew", vim.log.levels.DEBUG)
          end
        end
      '';
      options = { noremap = true; silent = true; desc = "New tab" ; };
    }

    # Ctrl-Tab -> switch between last two tabs
    {
      key = "<C-Tab>";
      mode = "n";
      action.__raw = ''
        function()
          -- TODO:
          vim.notify("TODO", vim.log.levels.WARN)
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
          -- TODO:
          vim.notify("TODO", vim.log.levels.WARN)
        end
      '';
      options = { noremap = true; silent = true; desc = "Toggle last two tabs (fallback)"; };
    }

    # Ctrl-W -> close current buffer
    {
      key = "<C-w>";
      mode = "n";
      action.__raw = ''
        function()
          Snacks.bufdelete()
        end
      '';
      options = { noremap = true; silent = true; nowait = true; desc = "Close current buffer"; };
    }

    # Ctrl-S -> save current buffer
    {
      key = "<C-s>";
      mode = "n";
      action = "<cmd> w <cr>";
      options = { desc = "Save current buffer"; };
    }
  ]

  # Ctrl-number mappings 1..9 (with literals embedded into the Lua body)
  ++ (lib.concatMap (n: [
    {
      key = toString n;
      mode = "n";
      action.__raw = ''
        function()
          local bf = require("bufferline")
          local target = '' + toString n + ''
          bf.go_to(target, true)
        end
      '';
      options = { noremap = true; silent = true; desc = "Goto buffer " + toString n ; };
    }
  ]) (lib.range 1 9));
}

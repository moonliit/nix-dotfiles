{ config, pkgs, ... }:

{
  # Themes
  xdg.configFile."nvim/colors/nonbinary-dark.lua".text =
    builtins.readFile ./themes/nonbinary-dark.lua;

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    waylandSupport = true;

    imports = [
      # Plugins
      ./plugins/autopairs.nix
      ./plugins/blink-cmp.nix
      ./plugins/bufferline.nix
      ./plugins/comment.nix
      ./plugins/conform.nix
      ./plugins/debug.nix
      ./plugins/flash.nix
      ./plugins/gitsigns.nix
      ./plugins/indent-blankline.nix
      ./plugins/lint.nix
      ./plugins/lsp.nix
      ./plugins/mini.nix
      ./plugins/neo-tree.nix
      ./plugins/snacks.nix
      ./plugins/telescope.nix
      ./plugins/todo-comments.nix
      ./plugins/treesitter.nix
      ./plugins/ux.nix
      ./plugins/which-key.nix
      ./plugins/yazi.nix
    ];

    colorschemes = {
      tokyonight = {
        enable = false;
        settings = {
          style = "night";
          styles.comments.italic = true;
        };
      };
      catppuccin = {
        enable = false;
        settings = {
          flavor = "mocha";
          italic = true;
          bold = true;
          dimInactive = false;
          transparent_background = false;
        };
      };
      vscode = {
        enable = false;
      };
    };

    clipboard.providers.wl-copy.enable = true;

    opts = {
      # Show line numbers
      number = true;
      # You can also add relative line numbers, to help with jumping.
      #  Experiment for yourself to see if you like it!
      # relativenumber = true;

      # Enable mouse mode, can be useful for resizing splits for example!
      mouse = "a";

      # Don't show the mode, since it's already in the statusline
      showmode = false;

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or one or more capital letters in the search term
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      timeoutlen = 300;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Sets how neovim will display certain whitespace characters in the editor
      #  See `:help 'list'`
      #  and `:help 'listchars'`
      list = true;
      # NOTE: .__raw here means that this field is raw lua code
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      # Preview substitutions live, as you type!
      inccommand = "split";

      # Show which line your cursor is on
      cursorline = true;

      # Minimal number of screen lines to keep above and below the cursor.
      scrolloff = 10;

      # if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
      # instead raise a dialog asking if you wish to save the current file(s)
      # See `:help 'confirm'`
      confirm = true;

      # See `:help hlsearch`
      hlsearch = true;

      # Tab size
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      # Indent stuff
      listchars = {
        tab = "  "; # just show spaces for tabs
        space = " ";
      };
    };

    # [[ Basic Keymaps ]]
    #  See `:help vim.keymap.set()`
    # https://nix-community.github.io/nixvim/keymaps/index.html
    keymaps = [
      # Clear highlights on search when pressing <Esc> in normal mode
      #  See `:help hlsearch`
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
      # is not what someone will guess without a bit more experience.
      #
      # NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
      # or just use <C-\><C-n> to exit terminal mode
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
        };
      }
      # TIP: Disable arrow keys in normal mode
      {
        mode = "n";
        key = "<left>";
        action = "<cmd>echo 'Use h to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<right>";
        action = "<cmd>echo 'Use l to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<up>";
        action = "<cmd>echo 'Use k to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<down>";
        action = "<cmd>echo 'Use j to move!!'<CR>";
      }
      # Keybinds to make split navigation easier.
      #  Use CTRL+<hjkl> to switch between windows
      #
      #  See `:help wincmd` for a list of all window commands
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = {
          desc = "Move focus to the left window";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = {
          desc = "Move focus to the right window";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = {
          desc = "Move focus to the lower window";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = {
          desc = "Move focus to the upper window";
        };
      }
    ];

    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };

    # [[ Basic Autocommands ]]
    #  See `:help lua-guide-autocommands`
    # https://nix-community.github.io/nixvim/NeovimOptions/autoCmd/index.html
    autoCmd = [
      # Highlight when yanking (copying) text
      #  Try it with `yap` in normal mode
      #  See `:help vim.hl.on_yank()`
      {
        event = [ "TextYankPost" ];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.hl.on_yank()
          end
        '';
      }
    ];

    diagnostic = {
      settings = {
        severity_sort = true;
        float = {
          border = "rounded";
          source = "if_many";
        };
        underline = {
          severity.__raw = ''vim.diagnostic.severity.ERROR'';
        };
        signs.__raw = ''
          vim.g.have_nerd_font and {
            text = {
              [vim.diagnostic.severity.ERROR] = '󰅚 ',
              [vim.diagnostic.severity.WARN] = '󰀪 ',
              [vim.diagnostic.severity.INFO] = '󰋽 ',
              [vim.diagnostic.severity.HINT] = '󰌶 ',
            },
          } or {}
        '';
        virtual_text = {
          source = "if_many";
          spacing = 2;
          format.__raw = ''
            function(diagnostic)
              local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
              }
              return diagnostic_message[diagnostic.severity]
            end
          '';
        };
      };
    };

    plugins = {
      web-devicons.enable = true;
      guess-indent.enable = true;
      fzf-lua.enable = true;
      trouble.enable = true;
      aerial.enable = true;
      trim.enable = true;
      lz-n.enable = true;
    };

    extraConfigLuaPost = builtins.readFile ./extra.lua;

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extraconfigluapost
    extraConfigLua = ''
      -- The line beneath this is called `modeline`. See `:help modeline`
      -- vim: ts=2 sts=2 sw=2 et
      vim.cmd("colorscheme nonbinary-dark");
    '';

  };
}

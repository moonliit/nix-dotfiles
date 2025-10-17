{
  plugins.floaterm = {
    enable = true;
    settings = {
      width = 0.9;
      height = 0.3;
      position = "bottom";
      wintype = "split";
      autoinsert = false;
      autoclose = 1;

      borderchars = "─│─│┌┐┘└"; # top, right, bottom, left, etc
      wintitle = true;
      title = "Floaterm ($1/$2)";
      titleposition = "center";

      # keymaps
      keymap_toggle = "<C-/>";      # toggle main floaterm
      keymap_new    = "<leader>t";  # open a new floaterm
      keymap_next   = "<leader>l";  # next floaterm
      keymap_prev   = "<leader>h";  # previous floaterm
      keymap_kill   = "<leader>x";  # kill current floaterm
   };
  };

  # highlightOverride is applied at startup (nixvim feature)
  highlightOverride = {
    # horizontal split separator (inactive/other window)
    StatusLineNC = {
      fg = "#c0caf5";
      bg = "#1f2335";
    };
    # active statusline (current window) if you want it different
    StatusLine = {
      fg = "#ffffff";
      bg = "#222235";
    };
    # vertical split/separator (if ever used)
    VertSplit = {
      fg = "#4b5266";
      bg = "#1f2335";
    };
    # newer WinSeparator group (Neovim 0.11+)
    WinSeparator = {
      fg = "#9a59cf"; # line
      bg = "NONE"; # bg
    };
  };
}

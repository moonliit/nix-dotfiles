{
  plugins.floaterm = {
    enable = true;
    settings = {
      width = 0.9;
      height = 0.35;
      position = "bottom";
      wintype = "split";
      autoinsert = false;
      autoclose = 1;

      # keymaps
      keymap_toggle = "<C-/>";  # toggle main floaterm
      keymap_new    = "<leader>t";  # open a new floaterm
      keymap_next   = "<leader>l";  # next floaterm
      keymap_prev   = "<leader>h";  # previous floaterm
      keymap_kill   = "<leader>x";  # kill current floaterm
   };
  };
}

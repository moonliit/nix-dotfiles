{
  plugins.noice = {
    enable = true;

    settings = {
      lsp = {
        progress = { enabled = true; };
        hover = { enabled = true; };
        signature = { enabled = true; };
      };

      # keep command_palette disabled so it doesn't force center/top placement
      presets = {
        command_palette = false;
        bottom_search = false;  # keep search popup behaviour separate
        long_message_to_split = true;
      };

      # Use the popup cmdline view
      cmdline = {
        view = "cmdline_popup";
      };

      # Position/size overrides for Noice's views
      views = {
        # the popup cmdline itself (we place it near the bottom)
        cmdline_popup = {
          position = {
            # Use a percentage to anchor near bottom; 90% is close to bottom.
            # You can tweak: "85%", "92%", or use negative ints like -3 for offset-from-bottom.
            row = "90%";
            col = "50%";
          };
          size = {
            width  = 70;
            height = "auto";
          };
          border = {
            style = "rounded";
          };
        };

        # position popupmenu (completion) right under the cmdline popup
        popupmenu = {
          relative = "editor";
          position = {
            row = "120%";    # slightly below the cmdline popup
            col = "50%";
          };
          size = {
            width  = 70;
            height = 10;
          };
          border = {
            style = "rounded";
            padding = [ 0 1 ];
          };
        };
      };
    };
  };
}

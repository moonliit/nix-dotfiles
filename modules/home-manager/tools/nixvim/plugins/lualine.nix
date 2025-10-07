{
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        theme = "auto"; # You can change to "tokyonight", "catppuccin", etc.
        section_separators = { left = ""; right = ""; };
        component_separators = { left = ""; right = ""; };
        globalstatus = true; # Makes it one continuous bar at the bottom
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "diagnostics" "filetype" ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };

      inactive_sections = {
        lualine_a = [];
        lualine_b = [];
        lualine_c = [ "filename" ];
        lualine_x = [ "location" ];
        lualine_y = [];
        lualine_z = [];
      };
    };
  };
}

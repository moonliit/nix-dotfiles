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

    luaConfig.post = ''
      require('lualine').setup {
        options = {
          theme = {
            normal = {
              a = { bg = '#f5c2e7', fg = '#1e1e2e', gui = 'bold' },
              b = { bg = '#302d41', fg = '#f5c2e7' },
              c = { bg = '#1e1e2e', fg = '#f8f8f2' },
            },
            insert = { a = { bg = '#a6e3a1', fg = '#1e1e2e', gui = 'bold' } },
            visual = { a = { bg = '#89b4fa', fg = '#1e1e2e', gui = 'bold' } },
            replace = { a = { bg = '#f38ba8', fg = '#1e1e2e', gui = 'bold' } },
            inactive = { a = { bg = '#1e1e2e', fg = '#6c7086' } },
          },
        },
      }
    '';
  };
}

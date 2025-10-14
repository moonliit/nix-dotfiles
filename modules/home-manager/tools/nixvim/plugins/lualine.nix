{
  plugins.lualine = {
    enable = true;

    settings = {
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [ "diff" ];
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
      local _fg = "#1f1b22"
      local _normal = "#f9e2af"
      local _insert = "#a6e3a1"
      local _visual = "#b4befe"
      local _terminal = "#c099ff"
      local _replace = "#f38ba8"
      local _inactive = "#7c7286"

      require('lualine').setup {
        options = {
          theme = {
            normal = {
              a = { bg = _normal, fg = _fg, gui = 'bold' },  -- active mode block
              b = { bg = '#2a2430', fg = '#f9e2af' },               -- mid blocks
              c = { bg = '#1f1b22', fg = '#cdd6f4' },               -- main area
            },
            insert  = { a = { bg = _insert, fg = _fg, gui = 'bold' } },
            visual  = { a = { bg = _visual, fg = _fg, gui = 'bold' } },
            terminal  = { a = { bg = _terminal, fg = _fg, gui = 'bold' } },
            replace = { a = { bg = _replace, fg = _fg, gui = 'bold' } },
            inactive = { a = { bg = _inactive, fg = _fg, gui = 'bold' } },
          },
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          globalstatus = true,
        },
      }
    '';
  };
}

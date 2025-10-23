{
  plugins.lualine = {
    enable = true;

    #CDD6F4

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
      -- status colors
      local _fg = "#1f1b22"
      local _normal = "#f9e2af"
      local _insert = "#a6e3a1"
      local _visual = "#b4befe"
      local _command = "#4ea1e6"
      local _terminal = "#c099ff"
      local _replace = "#f38ba8"
      local _inactive = "#7c7286"

      local function get_options(color_name)
        return {
          a = { bg = color_name, fg = _fg, gui = 'bold' }, -- active mode block
          b = { bg = '#2a2430', fg = color_name }, -- mid blocks
          c = { bg = '#1f1b22', fg = color_name }, -- main area
        }
      end

      require('lualine').setup {
        options = {
          theme = {
            normal = get_options(_normal),
            insert = get_options(_insert),
            visual = get_options(_visual),
            command = get_options(_command),
            terminal = get_options(_terminal),
            replace = get_options(_replace),
            inactive = get_options(_inactive),
          },
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          globalstatus = true,
        },
      }
    '';
  };
}

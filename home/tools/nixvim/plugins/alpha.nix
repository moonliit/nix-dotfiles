{
  plugins.alpha = {
    enable = true;
    #theme = "miasma";
    layout = [
      {
        type = "padding";
        val = 7;
      }
    ];
  };

  extraConfigLua = ''
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    _Gopts = {
      position = 'center',
      hl = 'Type',
      wrap = 'overflow',
    }

    -- DASHBOARD HEADER

    local function getGreeting(name)
      local tableTime = os.date '*t'
      local datetime = os.date ' %Y-%m-%d-%A   %H:%M:%S '
      local hour = tableTime.hour
      local greetingsTable = {
        [1] = '  Sleep well',
        [2] = '  Good morning',
        [3] = '  Good afternoon',
        [4] = '  Good evening',
        [5] = '󰖔  Good night',
      }
      local greetingIndex = 0
      if hour == 23 or hour < 7 then
        greetingIndex = 1
      elseif hour < 12 then
        greetingIndex = 2
      elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
      elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
      elseif hour >= 21 then
        greetingIndex = 5
      end
      return greetingsTable[greetingIndex] .. ', ' .. name .. '!'
    end

    local function getUsername()
      local n = math.random(1, 3)
      if n == 1 then
        return "lua"
      elseif n == 2 then
        return "moon"
      else
        return "mint"
      end
    end

    local userName = getUsername()
    local greeting = getGreeting(userName)

    local logo = [[










                                              
       ███████████           █████      ██
      ███████████             █████ 
      █████████ ███████ ███████████ ███   ███████
     ████████████████ ████████████ █████ ██████████████
    █████████████████████████████ █████ █████ ████ █████
  ██████████████████████████████████ █████ █████ ████ █████
 ██████  ███ █████████████████ ████ █████ █████ ████ ██████
 ██████   ██  ███████████████   ██ █████████████████

      ]]

    local marginBottom = 0

    -- Highlight groups configuration for each segment
    local header_hl = {
      { { "Red", 1, 1 } },
      { { "Red", 1, 1 } },
      { { "Red", 1, 1 } },
      { { "Red", 1, 1 } },
      { { "Red", 1, 1 } },
      { { "Red", 1, 1 } },
      { { "Red", 1, 1 } },
      { { "Red", 1, 1 } },
      { { "Red", 1, 1 } },
      { { "Red", 1, 1 } },              -- Empty lines
      { { "AlphaHeader0_0", 45, 47 } }, -- Line 10
      {                                 -- Line 11
        { "AlphaHeader1_0", 6,  21 },
        { "AlphaHeader1_1", 32, 39 },
        { "AlphaHeader1_2", 39, 49 }
      },
      { -- Line 12
        { "AlphaHeader2_0", 5,  20 },
        { "AlphaHeader2_1", 32, 44 },
        { "AlphaHeader1_2", 45, 60 },
      },
      { -- Line 13
        { "AlphaHeader3_0", 5,  18 },
        { "AlphaHeader3_1", 18, 19 },
        { "AlphaHeader3_2", 19, 34 },
        { "AlphaHeader3_3", 34, 44 },
        { "AlphaHeader3_4", 44, 89 },
      },
      { -- Line 14
        { "AlphaHeader4_0", 4,  17 },
        { "AlphaHeader4_1", 17, 35 },
        { "AlphaHeader4_2", 35, 44 },
        { "AlphaHeader4_3", 44, 89 }
      },
      { -- Line 15
        { "AlphaHeader5_0", 3,  16 },
        { "AlphaHeader5_1", 16, 23 },
        { "AlphaHeader5_2", 23, 27 },
        { "AlphaHeader5_3", 27, 36 },
        { "AlphaHeader5_4", 36, 45 },
        { "AlphaHeader5_5", 45, 89 },
      },
      { -- Line 16
        { "AlphaHeader6_0", 1,  16 },
        { "AlphaHeader6_1", 16, 37 },
        { "AlphaHeader6_2", 37, 44 },
        { "AlphaHeader6_3", 45, 89 },
      },
      { -- Line 17
        { "AlphaHeader7_0", 0,  16 },
        { "AlphaHeader7_1", 16, 37 },
        { "AlphaHeader7_2", 37, 44 },
        { "AlphaHeader7_3", 45, 89 },
      },
      { -- Line 18
        { "AlphaHeader8_0", 0,  36 },
        { "AlphaHeader8_1", 36, 90 },
      }
    }

    local nb = {
      yellow1 = "#fff238",
      yellow2 = "#fff04b",
      yellow3 = "#ffee5d",
      yellow4 = "#ffec70",
      yellow5 = "#ffea82",
      yellow6 = "#ffe894",
      yellow7 = "#ffe6a7",

      purple1 = "#5318c2",
      purple2 = "#622ac6",
      purple3 = "#6c37c9",
      purple4 = "#7643cc",
      purple5 = "#804fcf",
      purple6 = "#8959d1",
      purple7 = "#9467d5",

      white1 = "#c1c1c1",
      white2 = "#cbcbcb",
      white3 = "#d4d4d4",
      white4 = "#dddddd",
      white5 = "#e7e7e7",
      white6 = "#f0f0f0",
      white7 = "#fafafa",

      black  = "#1A0F18",
    }

    -- Map each AlphaHeader group to a color chosen from the palette above.
    -- (These group names match the ones in your header_hl table earlier.)
    local header_colors = {
      AlphaHeader0_0 = nb.purple1,

      AlphaHeader1_0 = nb.yellow1,
      AlphaHeader1_1 = nb.purple1,
      AlphaHeader1_2 = nb.purple1,

      AlphaHeader2_0 = nb.yellow2,
      AlphaHeader2_1 = nb.purple2,

      AlphaHeader3_0 = nb.yellow3,
      AlphaHeader3_1 = nb.white3,
      AlphaHeader3_2 = nb.white3,
      AlphaHeader3_3 = nb.purple3,
      AlphaHeader3_4 = nb.purple3,

      AlphaHeader4_0 = nb.yellow4,
      AlphaHeader4_1 = nb.white4,
      AlphaHeader4_2 = nb.purple4,
      AlphaHeader4_3 = nb.purple4,

      AlphaHeader5_0 = nb.yellow5,
      AlphaHeader5_1 = nb.white5,
      AlphaHeader5_2 = nb.black,
      AlphaHeader5_3 = nb.white5,
      AlphaHeader5_4 = nb.purple5,
      AlphaHeader5_5 = nb.purple5,

      AlphaHeader6_0 = nb.yellow6,
      AlphaHeader6_1 = nb.white6,
      AlphaHeader6_2 = nb.purple6,
      AlphaHeader6_3 = nb.purple6,

      AlphaHeader7_0 = nb.yellow7,
      AlphaHeader7_1 = nb.white7,
      AlphaHeader7_2 = nb.purple7,
      AlphaHeader7_3 = nb.purple7,

      AlphaHeader8_0 = nb.black,
      AlphaHeader8_1 = nb.black,
    }

    -- apply them programmatically (keeps the file compact)
    for name, hex in pairs(header_colors) do
      vim.api.nvim_set_hl(0, name, { fg = hex })
    end

    local utils = require('alpha.utils')

    local header_val = vim.split(logo, '\n')
    header_hl = utils.charhl_to_bytehl(header_hl, header_val, false)

    dashboard.section.header.opts.hl = header_hl
    dashboard.section.header.val = header_val
    -- Split logo into lines
    local logoLines = {}
    for line in logo:gmatch '[^\r\n]+' do
      table.insert(logoLines, line)
    end

    -- Calculate padding for centering the greeting
    local logoWidth                   = logo:find '\n' - 1 -- Assuming the logo width is the width of the first line
    local greetingWidth               = #greeting
    local padding                     = math.floor((logoWidth - greetingWidth) / 2)

    -- Generate spaces for padding
    local paddedGreeting              = string.rep(' ', padding) .. greeting

    -- Add margin lines below the padded greeting
    local margin                      = string.rep('\n', marginBottom)

    -- Concatenate logo, padded greeting, and margin
    local adjustedLogo                = logo .. '\n' .. paddedGreeting .. margin

    local init_path                   = vim.fn.stdpath('config')

    -- create greeting section
    dashboard.section.greeting = {
      type = "text",
      val = greeting,
      opts = { position = "center", hl = "MatchParen" },
    }

    dashboard.section.buttons.val     = {
      dashboard.button('f', '󰮗  Find file', ':silent Telescope find_files hidden=true no_ignore=true <CR>'),
      dashboard.button('n', '  New file', ':silent ene <BAR> startinsert<CR>'),
      dashboard.button('r', '󰄉  Recent files', ':silent Telescope oldfiles<CR>'),
      dashboard.button('r', '󰊢  Git files', ':silent Telescope git_files<CR>'),
      dashboard.button('q', '󰿅  Quit', '<cmd>qa<CR>'),
    }
    dashboard.section.buttons.opts.hl = 'AlphaHeader1_0'

    --dashboard.section.footer.val = vim.split('\n\n' .. getGreeting 'lua', '\n')

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      desc = 'Add Alpha dashboard footer',
      once = true,
      callback = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = {
          ' ', ' ', ' ', ' Loaded ' .. stats.count .. ' plugins  in ' .. ms .. ' ms ', ' ', ' ', ' ', ' ', ' ', ' ',
          ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
    -- Hide all the unnecessary visual elements while on the dashboard, and add
    -- them back when leaving the dashboard.
    local group = vim.api.nvim_create_augroup('CleanDashboard', {})

    vim.api.nvim_create_autocmd('User', {
      group = group,
      pattern = 'AlphaReady',
      callback = function()
        -- vim.opt.showtabline = 0
        -- vim.opt.showmode = true
        -- vim.opt.laststatus = 3
        vim.opt.showcmd = false
        vim.opt.ruler = false
      end,
    })

    vim.api.nvim_create_autocmd('BufUnload', {
      group = group,
      pattern = '<buffer>',
      callback = function()
        -- vim.opt.showtabline = 0
        -- vim.opt.showmode = true
        -- vim.opt.laststatus = 3
        vim.opt.showcmd = true
        vim.opt.ruler = true
      end,
    })
    dashboard.opts.opts.noautocmd = true

    dashboard.opts.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      dashboard.section.greeting,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)
  '';
}

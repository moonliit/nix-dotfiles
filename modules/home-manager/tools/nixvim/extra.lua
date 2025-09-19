-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ""

-- Neotree seutp
local autocmd = vim.api.nvim_create_autocmd

-- Open Neo-tree on startup
autocmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree show")
	end,
})

-- Quit Neovim entirely if :q is used
vim.cmd([[cnoreabbrev <expr> q ((getcmdtype() == ':' && getcmdline() == 'q') ? 'qa' : 'q')]])

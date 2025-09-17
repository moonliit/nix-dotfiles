-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ""

local autocmd = vim.api.nvim_create_autocmd

-- Open Neo-tree on startup
autocmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree show")
	end,
})

-- Close Neo-tree if it's the last window left
autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 then
			local bufname = vim.api.nvim_buf_get_name(0)
			if string.match(bufname, "neo%-tree filesystem") then
				vim.cmd("quit")
			end
		end
	end,
})

-- Quit Neovim entirely if :q or q is used inside Neo-tree
autocmd("FileType", {
	pattern = "neo-tree",
	callback = function()
		-- map 'q' in normal mode to quit Neovim instead of closing Neo-tree only
		vim.keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })

		-- override :q to also quit Neovim from Neo-tree
		--vim.api.nvim_buf_create_user_command(0, "q", "qa", {})
		vim.cmd("cnoreabbrev <buffer> q qa")
	end,
})

-- turn off list symbols so you don't get >> / » markers
vim.opt.list = false
-- keep sane listchars if you still want to visualize trailing spaces (optional)
vim.opt.listchars = { tab = "  ", trail = "·" }

-- prefer ibl.nvim if present, otherwise try indent-blankline as fallback.
local ok_ibl, ibl = pcall(require, "ibl")
if ok_ibl and type(ibl.setup) == "function" then
	-- configure ibl: vertical lines for indentation
	pcall(ibl.setup, {
		indent = {
			char = "│", -- glyph to draw
			tab_char = "│",
			highlight = "Folded",
			smart = true,
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
		},
	})
else
	-- fallback to indent-blankline if ibl isn't available
	local ok_ib, indent_blankline = pcall(require, "indent_blankline")
	if ok_ib and type(indent_blankline.setup) == "function" then
		pcall(indent_blankline.setup, {
			char = "│",
			show_trailing_blankline_indent = false,
			show_first_indent_level = false,
			use_treesitter = true,
			show_current_context = false,
		})
	end
end

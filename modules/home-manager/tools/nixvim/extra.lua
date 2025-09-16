-- Open Neo-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- only open if no files were specified on the command line
		if vim.fn.argc() == 0 then
			vim.cmd("Neotree show")
		end
	end,
})

-- Close Neo-tree if it's the last window left
vim.api.nvim_create_autocmd("BufEnter", {
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

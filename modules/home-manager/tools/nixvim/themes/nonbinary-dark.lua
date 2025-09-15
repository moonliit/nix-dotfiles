-- myhelix.lua - Neovim colorscheme ported from your Helix theme
local theme = {}

theme.set_highlights = function()
	-- UI elements
	vim.cmd("hi Normal guibg=#2f1f31 guifg=#9fd6d8")
	vim.cmd("hi Cursor guibg=#ffcc00 guifg=#15151a")
	vim.cmd("hi Visual guibg=#2f4f73 guifg=#ffffff")
	vim.cmd("hi StatusLine guibg=#8a4bbf guifg=#ffffff")
	vim.cmd("hi StatusLineNC guibg=#17131a guifg=#b08ad1")
	vim.cmd("hi LineNr guifg=#6e6e76")
	vim.cmd("hi CursorLineNr guifg=#ebebeb")

	-- Syntax
	vim.cmd("hi Comment guifg=#15f371 gui=italic")
	vim.cmd("hi String guifg=#e07a4a")
	vim.cmd("hi Number guifg=#c97fcf")
	vim.cmd("hi Constant guifg=#4ea1e6")
	vim.cmd("hi Type guifg=#33caa0")
	vim.cmd("hi Keyword guifg=#b25db0")
	vim.cmd("hi Function guifg=#f0bf00")
	vim.cmd("hi Identifier guifg=#9fd6d8")
	vim.cmd("hi Operator guifg=#33caa0")

	-- Diagnostics
	vim.cmd("hi Error guifg=#ff6b6b guibg=#15151a")
	vim.cmd("hi WarningMsg guifg=#e0a86e guibg=#15151a")
	vim.cmd("hi DiagnosticInfo guifg=#4ea1e6 guibg=#15151a")
	vim.cmd("hi DiagnosticHint guifg=#8fdbe6 guibg=#15151a")

	-- Tree-sitter linking
	vim.cmd("hi link @variable Identifier")
	vim.cmd("hi link @function Function")
	vim.cmd("hi link @keyword Keyword")
	vim.cmd("hi link @string String")
	vim.cmd("hi link @number Number")
	vim.cmd("hi link @comment Comment")
	vim.cmd("hi link @type Type")
end

theme.set_highlights()

return theme

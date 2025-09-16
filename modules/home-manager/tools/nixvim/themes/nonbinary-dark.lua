-- nonbinary-dark.lua - Neovim colorscheme, ported & mapped to Tree-sitter groups
vim.g.colors_name = "nonbinary-dark"
local hl = vim.api.nvim_set_hl

-- palette
local bg = "#2f1f31"
local fg = "#9fd6d8"
local cursorFg = "#15151a"
local cursorBg = "#ffcc00" -- visible cursor color (yellow)
local selection = "#2f4f73"
local selectionStrong = "#355b87"
local statusBg = "#8a4bbf"
local statusFg = "#ffffff"
local comment = "#49c07a"
local string = "#e07a4a"
local number = "#c97fcf"
local constant = "#4ea1e6"
local typ = "#33caa0"
local keyword = "#b25db0"
local operator = "#33caa0"
local func = "#f0bf00"
local var = "#9fd6d8"
local namespace = "#3fe2d4"
local errorFg = "#ff6b6b"
local warnFg = "#e0a86e"
local infoFg = "#4ea1e6"
local hintFg = "#8fdbe6"
local gutterBg = "#15151a"
local linenr = "#6e6e76"
local linenrSel = "#ebebeb"
local indentGuide = "#262629"

-- UI groups
hl(0, "Normal", { bg = bg, fg = fg })
hl(0, "Cursor", { fg = cursorFg, bg = cursorBg }) -- GUI cursor color
hl(0, "Visual", { bg = selection, fg = "#ffffff" })
hl(0, "VisualNOS", { bg = selection }) -- fallback
hl(0, "CursorLine", { bg = nil })
hl(0, "CursorLineNr", { fg = linenrSel })
hl(0, "LineNr", { fg = linenr })
hl(0, "StatusLine", { bg = statusBg, fg = statusFg })
hl(0, "StatusLineNC", { bg = "#17131a", fg = "#b08ad1" })
hl(0, "Pmenu", { bg = "#19161b", fg = fg })
hl(0, "PmenuSel", { bg = selectionStrong, fg = "#ffffff" })
hl(0, "PmenuSbar", { bg = "#1b1820" })
hl(0, "PmenuThumb", { bg = selectionStrong })
hl(0, "Title", { fg = statusFg, bold = true })
hl(0, "TabLine", { bg = "#1b1620", fg = "#9aa6a6" })
hl(0, "TabLineSel", { bg = statusBg, fg = statusFg })

-- Virtual guides / indent
hl(0, "IndentBlanklineChar", { fg = indentGuide })

-- Syntax / Tree-sitter groups (direct mapping)
-- Standard vim groups
hl(0, "Comment", { fg = comment, italic = true })
hl(0, "String", { fg = string })
hl(0, "Number", { fg = number })
hl(0, "Constant", { fg = constant })
hl(0, "Boolean", { fg = constant })
hl(0, "Identifier", { fg = var })
hl(0, "Function", { fg = func })
hl(0, "Keyword", { fg = keyword })
hl(0, "Operator", { fg = operator })
hl(0, "Type", { fg = typ })
hl(0, "Structure", { fg = namespace })
hl(0, "PreProc", { fg = keyword })
hl(0, "Special", { fg = keyword })
hl(0, "Error", { fg = errorFg, bg = gutterBg })
hl(0, "WarningMsg", { fg = warnFg, bg = gutterBg })
hl(0, "Info", { fg = infoFg, bg = gutterBg })
hl(0, "Hint", { fg = hintFg, bg = gutterBg })

-- Treesitter specific groups (preferred when nvim-treesitter is present)
-- Use the same group names as nvim-treesitter to apply colors at parse level
hl(0, "@comment", { fg = comment, italic = true })
hl(0, "@string", { fg = string })
hl(0, "@string.regex", { fg = string })
hl(0, "@string.escape", { fg = string })
hl(0, "@character", { fg = number })
hl(0, "@number", { fg = number })
hl(0, "@boolean", { fg = constant })
hl(0, "@constant", { fg = constant })
hl(0, "@constant.builtin", { fg = constant })
hl(0, "@constant.macro", { fg = constant })
hl(0, "@identifier", { fg = var })
hl(0, "@variable", { fg = var })
hl(0, "@variable.builtin", { fg = var })
hl(0, "@property", { fg = var })
hl(0, "@field", { fg = var })
hl(0, "@function", { fg = func })
hl(0, "@function.builtin", { fg = func })
hl(0, "@function.macro", { fg = func })
hl(0, "@method", { fg = func })
hl(0, "@constructor", { fg = func })
hl(0, "@keyword", { fg = keyword })
hl(0, "@keyword.function", { fg = keyword })
hl(0, "@keyword.operator", { fg = operator })
hl(0, "@keyword.return", { fg = keyword })
hl(0, "@conditional", { fg = keyword })
hl(0, "@repeat", { fg = keyword })
hl(0, "@label", { fg = keyword })
hl(0, "@type", { fg = typ })
hl(0, "@type.builtin", { fg = typ })
hl(0, "@namespace", { fg = namespace })
hl(0, "@parameter", { fg = var })
hl(0, "@punctuation.bracket", { fg = fg })
hl(0, "@punctuation.delimiter", { fg = fg })
hl(0, "@punctuation.special", { fg = fg })
hl(0, "@text", { fg = fg })
hl(0, "@tag", { fg = keyword })
hl(0, "@attribute", { fg = var })

-- fallback links for any groups left unmatched (keeps consistency)
vim.cmd("hi link @variable Identifier")
vim.cmd("hi link @function Function")
vim.cmd("hi link @keyword Keyword")
vim.cmd("hi link @string String")
vim.cmd("hi link @number Number")
vim.cmd("hi link @comment Comment")
vim.cmd("hi link @type Type")

-- set palette in global for reference (optional)
vim.g.myhelix_palette = {
	cursor = "#ffcc00",
	selection = "#2f4f73",
	comment = "#49c07a",
	keyword = "#b25db0",
	operator = "#33caa0",
	string = "#e07a4a",
	number = "#c97fcf",
	variable = "#9fd6d8",
	constant = "#4ea1e6",
	func = "#f0bf00",
	type = "#33caa0",
	namespace = "#3fe2d4",
	background = "#2f1f31",
}

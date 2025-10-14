-- nonbinary-dark.lua - exact-port from your Helix theme with extra TS mappings
-- + cursorline bg, diagnostic undercurl highlights, and git sign highlights
vim.g.colors_name = "nonbinary-dark"
local hl = vim.api.nvim_set_hl

-- exact palette from your Helix theme
local bg = "#2f1f31"
local fg = "#9fd6d8"
local cursorFg = "#15151a"
local cursorBg = "#ffcc00"
local selection = "#2f4f73"
local selectionStrong = "#355b87"
local statusBg = "#8a4bbf"
local statusFg = "#ffffff"
local comment = "#15f371"
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

-- #121418
-- #2b1c2d

-- UI groups
hl(0, "Normal", { bg = bg, fg = fg })
hl(0, "Cursor", { fg = cursorFg, bg = cursorBg })
hl(0, "Visual", { bg = selection, fg = "#ffffff" })
hl(0, "VisualNOS", { bg = selection })
-- Make the current line have a light-ish background to be obvious
hl(0, "CursorLine", { bg = "#352433" }) -- slightly lighter than bg
hl(0, "CursorLineNr", { fg = linenrSel })
hl(0, "LineNr", { fg = linenr })
hl(0, "StatusLine", { bg = statusBg, fg = statusFg })
hl(0, "StatusLineNC", { bg = "#17131a", fg = "#b08ad1" })
hl(0, "Pmenu", { bg = "#19161b", fg = fg })
hl(0, "PmenuSel", { bg = selectionStrong, fg = "#ffffff" })
hl(0, "PmenuSbar", { bg = "#1b1820" })
hl(0, "PmenuThumb", { bg = selectionStrong })
hl(0, "Title", { fg = statusFg, bold = true })
hl(0, "TabLine", { bg = "#15151a", fg = "#cdd6f4" })
hl(0, "TabLineSel", { bg = statusBg, fg = statusFg })

-- Virtual guides / indent
hl(0, "IndentBlanklineChar", { fg = indentGuide })

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
hl(0, "@keyword.operator", { fg = keyword })
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

-- Extra catch-all @... groups that C/C++ or other grammars sometimes emit
hl(0, "@keyword.storage", { fg = keyword })
hl(0, "@storageclass", { fg = typ })
hl(0, "@type.qualifier", { fg = typ })
hl(0, "@type.builtin", { fg = typ })
hl(0, "@constructor.special", { fg = func })
hl(0, "@keyword.include", { fg = keyword })
hl(0, "@directive", { fg = keyword })
hl(0, "@macro", { fg = constant })
hl(0, "@symbol", { fg = constant })
hl(0, "@enum", { fg = constant })
hl(0, "@enum.member", { fg = constant })
hl(0, "@enum.variant", { fg = constant })

-- Diagnostic underline (squiggles) and sign highlights
-- Make undercurl (squiggle) colored appropriately
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = errorFg })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = warnFg })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = infoFg })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = hintFg })

-- Sign highlights (in case signs are enabled)
hl(0, "DiagnosticSignError", { fg = errorFg })
hl(0, "DiagnosticSignWarn", { fg = warnFg })
hl(0, "DiagnosticSignInfo", { fg = infoFg })
hl(0, "DiagnosticSignHint", { fg = hintFg })

-- Git / diff sign highlighting (for gitsigns.nvim or signcolumn diffs)
hl(0, "GitSignsAdd", { fg = constant }) -- added lines
hl(0, "GitSignsChange", { fg = operator }) -- changed lines
hl(0, "GitSignsDelete", { fg = errorFg }) -- removed lines
hl(0, "GitSignsAddNr", { fg = constant })
hl(0, "GitSignsChangeNr", { fg = operator })
hl(0, "GitSignsDeleteNr", { fg = errorFg })

-- Diff groups too
hl(0, "DiffAdd", { fg = constant, bg = nil })
hl(0, "DiffChange", { fg = operator, bg = nil })
hl(0, "DiffDelete", { fg = errorFg, bg = nil })

-- Ensure sign column background doesn't clash
hl(0, "SignColumn", { bg = bg })

-- Diagnostic squiggles (undercurls)
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#ff6b6b" })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#e0a86e" })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#4ea1e6" })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#8fdbe6" })
hl(0, "DiagnosticHint", { fg = "#FFFF00", underline = true })
hl(0, "DiagnosticWarn", { fg = "#FFFF00", underline = true })

-- fallback links for any groups left unmatched
vim.cmd("hi link @variable Identifier")
vim.cmd("hi link @function Function")
vim.cmd("hi link @keyword Keyword")
vim.cmd("hi link @string String")
vim.cmd("hi link @number Number")
vim.cmd("hi link @comment Comment")
vim.cmd("hi link @type Type")

-- export palette for other plugins or user's reference
vim.g.nonbinary_dark_palette = {
	cursor = cursorBg,
	selection = selection,
	comment = comment,
	keyword = keyword,
	operator = operator,
	string = string,
	number = number,
	variable = var,
	constant = constant,
	func = func,
	type = typ,
	namespace = namespace,
	background = bg,
}

-- Optional: prefer squiggles and no sign letters by default.
-- If you want to keep sign letters, remove or change the following config.
vim.diagnostic.config({
	signs = false, -- disable gutter letters (E/W/...)
	underline = true, -- enable undercurl/underline
	virtual_text = {
		spacing = 2,
		prefix = "●",
	},
	float = { border = "rounded" }, -- when floating windows are opened
	update_in_insert = false,
})

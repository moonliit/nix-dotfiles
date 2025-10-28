-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ""

vim.keymap.set("n", "<leader>p", function()
  vim.cmd("echo mode()")
end, { noremap=true, silent=true })

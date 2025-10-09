vim.g.mapleader = " "
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- Keep cursor in the center when jumping down/up remap
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")


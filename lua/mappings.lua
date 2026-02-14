require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Remap çç to Escape in insert and terminal modes
vim.keymap.set('i', 'çç', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('t', 'çç', '<C-\\><C-n>', { noremap = true, silent = true })

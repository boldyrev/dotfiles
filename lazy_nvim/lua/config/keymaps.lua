-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy to system buffer
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = false })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = false })

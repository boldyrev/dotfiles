-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Better escape
vim.keymap.set("i", "jk", "<ESC>")

-- Begin / end off line on insert mode
vim.keymap.set("i", "<C-b>", "<ESC>^i")
vim.keymap.set("i", "<C-e>", "<End>")

-- No highlight
vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>")

-- Copy whole file
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>")

-- New buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>")

-- Close buffer
vim.keymap.set("n", "<leader>x", "<cmd> bd <CR>")

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
vim.keymap.set("x", "p", "p:let @+=@0<CR>:let @'=@0<CR>", { silent = true })
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy to system buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Easy select all of file
vim.keymap.set("n", "<C-a>", "ggVG<c-$>")

-- Keep centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Line bubbling
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>==gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>==gv=gv")

-- Add blank line
vim.keymap.set("n", "<leader>k", ":pu! _<cr>:']+1<CR>")
vim.keymap.set("n", "<leader>j", ":pu _<cr>:'[-1<CR>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Undo tree
vim.keymap.set('n', '<leader>u', ":UndotreeToggle<CR>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

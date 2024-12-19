-- Begin / end off line
vim.keymap.set("n", "E", "$", {noremap=false})
vim.keymap.set("n", "B", "^", {noremap=false})
vim.keymap.set("i", "<C-b>", "<ESC>^i")
vim.keymap.set("i", "<C-e>", "<End>")

-- No highlight
vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>")

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
vim.keymap.set("x", "p", "p:let @+=@0<CR>:let @'=@0<CR>", { silent = true })
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy to system buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Keep centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Replace
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

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Reselect pasted chunk
vim.keymap.set('n', 'gp', '`[v`]', { noremap = true })

-- Toggle git blame
vim.keymap.set("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<CR>")

vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>gf", ":LazyGitFilterCurrentFile<CR>")
vim.keymap.set("n", "<leader>gl", ":LazyGitFilter<CR>")

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<leader>h", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>")
vim.keymap.set("n", "<Down>", ":resize +2<CR>")
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>")

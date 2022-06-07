local map = require("core.utils").map

-- Easy select all of file
-- map("n", "<c-s>a", "ggVG<c-$>")

-- Quick new file
-- map("n", "<Leader>n", "<cmd>enew<CR>")

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Line bubbling
map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
map("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

-- Add blank line in normal mode
map("n", "<leader>k", ":pu! _<cr>:']+1<cr>", { silent = true })
map("n", "<leader>j", ":pu _<cr>:'[-1<cr>", { silent = true })

-- truezen
map("n", "<leader>ta", ":TZAtaraxis <CR>")
map("n", "<leader>tm", ":TZMinimalist <CR>")
map("n", "<leader>tf", ":TZFocus <CR>")


-- markdown prewiew
map("n", "<leader>m", ":MarkdownPreview github<CR>")
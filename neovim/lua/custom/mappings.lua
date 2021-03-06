local M = {}

M.my = {
   n = {
      -- Easy select all of file
      ["<leader>sa"] = { "ggVG<c-$>", "select all" },

      -- Keep search results centered
      ["n"] = { "nzzzv", "keep search results centered" },
      ["N"] = { "Nzzzv", "keep search results centered" },
      ["J"] = { "mzJ`z", "keep search results centered" },

      -- Line bubbling
      ["<C-j>"] = { "<cmd>m .+1<CR>==", "to one line down" },
      ["<C-k>"] = { "<cmd>m .-2<CR>==", "to one line up" },

      -- Add blank line
      ["<leader>k"] = { ":pu! _<cr>:']+1<cr>", "add blank line before current line" },
      ["<leader>j"] = { ":pu _<cr>:'[-1<cr>", "add blank line after current line" },

      -- Markdown preview
      ["<leader>m"] = { ":markdownpreview github<cr>", "markdown preview" },
   },

   v = {
      -- Line bubbling
      ["<C-j>"] = { ":m '>+1<CR>==gv=gv", "to one line down" },
      ["<C-k>"] = { ":m '<-2<CR>==gv=gv", "to one line up" },
   },
}

return M

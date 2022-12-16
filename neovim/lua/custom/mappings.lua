local M = {}

M.my = {
   i = {
      ["jk"] = { "<ESC>", "escape to normal mode" },
   },

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
      ["<leader>m"] = { ":MarkdownPreviewToggle<cr>", "markdown preview" },

      -- Git diff current buffer
      -- ["<leader>gd"] = { ":Gitsigns diffthis<cr>", "git diff" },

      ["<leader>le"] = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "show full error message" },
      ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
      ["<leader>ls"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature help" },
      ["<leader>lf"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "format document" },
      ["<leader>ld"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "hover documentation" },

      ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "go to definition" },
      ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "go to declaration" },
      ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "go to implementation" },
      ["gt"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "go to type defenition" },

      -- Debugging
      ["<F5>"] = { "<cmd>lua require'dap'.continue()<cr>", "debug -> continue" },
      ["<F9>"] = { "<cmd>lua require'dap'.run_last()<cr>", "debug -> run last" },
      ["<F10>"] = { "<cmd>lua require'dap'.step_over()<cr>", "debug -> step over" },
      ["<F11>"] = { "<cmd>lua require'dap'.step_into()<cr>", "debug -> step into" },
      ["<F12>"] = { "<cmd>lua require'dap'.repl.open()<cr>", "debug -> repl open" },
      ["<leader>b"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "debug -> toggle breakpoint" },
      ["<leader>B"] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "debug -> breakpoint with condition" },
      ["<leader>BB"] = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "debug -> breakpoint with message" },
      ["<leader>dd"] = { "<cmd>lua require'dapui'.toggle()<cr>", "debug -> toggle debug UI" },
   },

   v = {
      -- Line bubbling
      ["<C-j>"] = { ":m '>+1<CR>==gv=gv", "to one line down" },
      ["<C-k>"] = { ":m '<-2<CR>==gv=gv", "to one line up" },
   },

   -- Only visual mode
   x = {
      ["<leader>p"] = { "\"_dP", "paste from \" registry" },
   },
}

return M

local M = {}

-- overriding default plugin configs!
M.treesitter = {
   ensure_installed = {
      "lua",
      "html",
      "css",
      "javascript",
      "json",
      "toml",
      "markdown",
      "ruby",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

M.cmp = {
   completion = {
      autocomplete = false,
   },
},

return M

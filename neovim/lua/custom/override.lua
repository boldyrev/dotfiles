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
      "python",
   },
}

-- Need run :MasonInstallAll command!
M.mason = {
   ensure_installed = {
    -- lsp
    "lua-language-server",
    "pyright",
    "solargraph",

    -- linrers
    "pylint",
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
}

return M

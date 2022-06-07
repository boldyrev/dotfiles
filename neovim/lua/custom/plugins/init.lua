return {
  {
    "Pocco81/TrueZen.nvim",
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  {
    "williamboman/nvim-lsp-installer",
    config = function()
      require "custom.plugins.lspconfig"
    end,
  },

  -- {
  --   "neovim/nvim-lspconfig",
  --   module = "lspconfig",
  --   after = "nvim-lsp-installer",
  -- },

  {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "sandwich"}
    end
  },

  { "tpope/vim-rails" },

  { "slim-template/vim-slim" },

  { "davidgranstrom/nvim-markdown-preview" },
}

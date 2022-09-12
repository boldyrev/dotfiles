local M = {}

M.mappings = require "custom.mappings"

local override = require "custom.override"

M.plugins = {
    status = {
      colorizer = true,
    },

    options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
    },

    override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["hrsh7th/nvim-cmp"] = override.cmp,
      ["williamboman/mason.nvim"] = override.mason,
    },

    user = require "custom.plugins",

    remove = {
      "windwp/nvim-autopairs",
    }
}

M.ui = {
  theme = "gruvbox",
  statusline = {
    separator_style = "arrow",
  },
}

return M

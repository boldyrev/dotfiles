local M = {}

M.mappings = require "custom.mappings"

local override = require "custom.override"

M.plugins = {
    status = {
      colorizer = true,
    },

    options = {
      statusline = {
        separator_style = "arrow",
      },

      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
    },

    override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["hrsh7th/nvim-cmp"] = override.cmp,
    },

    user = require "custom.plugins",
}

M.ui = {
   theme = "gruvbox",
}

return M

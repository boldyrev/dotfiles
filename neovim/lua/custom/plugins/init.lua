return {
  ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
  },
  ["ur4ltz/surround.nvim"] = {
    config = function()
      require("surround").setup({ mappings_style = "sandwich" })
    end,
  },

  ["tpope/vim-rails"] = {},
  ["slim-template/vim-slim"] = {},
  ["davidgranstrom/nvim-markdown-preview"] = {},
}

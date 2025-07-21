return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  priority = 1000,
  config = function()
    require("nvim-tree").setup()

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
  end,
}


require "core.options"
require "core.remaps"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require "plugins.autocmp",
  require "plugins.colorscheme",
  require "plugins.colorscheme",
  require "plugins.gitsigns",
  require "plugins.harpoon",
  require "plugins.lsp",
  require "plugins.lualine",
  require "plugins.nvim-tree",
  require "plugins.pymple",
  require "plugins.snacks",
  require "plugins.telescope",
  require "plugins.treesitter",

  require "plugins.other",
})

require "core.misc"
require "plugins.noice"

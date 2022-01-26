require("custom.autochad_cmds")

local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
  use {
    "williamboman/nvim-lsp-installer",
    config = function()
      require "custom.plugins.lspconfig"
    end,

    -- lazy load!
    setup = function()
      require("core.utils").packer_lazy_load "nvim-lsp-installer"
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function()
         vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end,
    opt = true,
  }

  use {
    "neovim/nvim-lspconfig",
    module = "lspconfig",
    after = "nvim-lsp-installer",
  }

  use {
     "blackCauldron7/surround.nvim",
     config = function()
       require"surround".setup {mappings_style = "sandwich"}
     end
  }

  use { 'tpope/vim-rails' }

  use { 'slim-template/vim-slim' }
end)

local map = require("core.utils").map

-- Easy select all of file
map("n", "<c-s>a", "ggVG<c-$>")

-- Quick new file
-- map("n", "<Leader>n", "<cmd>enew<CR>")

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Line bubbling
map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
map("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

-- Add blank line in normal mode
map("n", "<leader>k", ":pu! _<cr>:']+1<cr>", { silent = true })
map("n", "<leader>j", ":pu _<cr>:'[-1<cr>", { silent = true })

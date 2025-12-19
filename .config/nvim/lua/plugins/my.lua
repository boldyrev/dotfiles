return {
  -- themes
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   config = function()
  --     require("gruvbox").setup({
  --       bold = false,
  --     })
  --     vim.o.termguicolors = true
  --     vim.o.background = "dark"
  --     vim.cmd.colorscheme("gruvbox")
  --   end,
  -- },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kanso-ink")
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("kanagawabones")
      -- vim.cmd.colorscheme("rosebones")
      -- vim.api.nvim_set_hl(0, "Comment", { bold = false })
      -- vim.api.nvim_set_hl(0, "Function", { bold = false })
      -- vim.api.nvim_set_hl(0, "Keyword", { bold = false })
      -- vim.api.nvim_set_hl(0, "Normal", { bold = false })
      -- vim.api.nvim_set_hl(0, "Statement", { bold = false })
      -- vim.api.nvim_set_hl(0, "Special", { bold = false })
      -- vim.api.nvim_set_hl(0, "Macro", { bold = false })
      -- vim.api.nvim_set_hl(0, "@function", { bold = false })
      -- vim.api.nvim_set_hl(0, "@keyword", { bold = false })
      -- vim.api.nvim_set_hl(0, "@constant", { bold = false })
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        ---@class snacks.picker.sources.Config
        sources = {
          files = {
            hidden = true, -- show hidden files
            ignored = true,
          },
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
        ---@class snacks.picker.formatters.Config
        ---formatters = {
        ---  file = {
        ---    filename_first = true, -- display filename before the file path
        ---  },
        ---},
      },
      styles = {
        -- LazyGit full screen
        lazygit = {
          width = 0,
          height = 0,
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    -- Make blink.cmp toogleable
    opts = function(_, opts)
      vim.b.completion = false

      Snacks.toggle({
        name = "Completion",
        get = function()
          return vim.b.completion
        end,
        set = function(state)
          vim.b.completion = state
        end,
      }):map("<leader>uk")

      opts.enabled = function()
        return vim.b.completion ~= false
      end
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false,
                compositeLiteralFields = true,
                compositeLiteralTypes = false,
                constantValues = true,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
              },
            },
          },
        },
      },
    },
  },
}

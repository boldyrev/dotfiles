local enable_no_neck_pain = false
local enable_oil = false

return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        bold = false,
      })
      vim.o.termguicolors = true
      vim.o.background = "dark"
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
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

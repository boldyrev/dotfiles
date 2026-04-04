return {
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
    config = function() end,
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

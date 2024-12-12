return {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  cmd = {"Telescope"},

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  keys = function()
    local cmdT = "<cmd>Telescope "
    return {
      {"<leader>fM", cmdT .. "man_pages<cr>", desc = "Telescope man pages" },
      {"<leader>fR", cmdT .. "registers<cr>", desc = "Telescope registers" },
      {"<leader>fk", cmdT .. "keymaps<cr>", desc = "Telescope keymaps" },

      {"<leader>fb", cmdT .. "buffers<cr>", desc = "Telescope buffers" },
      -- {"<leader>fd", cmdT .. "diagnostics<cr>", desc = "Telescope diagnostics" },
      {"<leader>ff", cmdT .. "find_files<cr>", desc = "Telescope Find files" },
      {"<leader>fw", cmdT .. "live_grep<cr>", desc = "Telescope Live Grep" },
      {"<leader>fW", cmdT .. "grep_string<cr>", desc = "Telescope Find Word" },
      {"<leader>fu", cmdT .. "lsp_references show_line=false<cr>", desc = "Telescope LSP Refernces" },

      {"<leader>gC", cmdT .. "git_commits<cr>", desc = "Telescope git commits" },
      -- {"<leader>gb", cmdT .. "git_branches<cr>", desc = "Telescope git branches" },
      -- {"<leader>go", cmdT .. "git_status<cr>", desc = "Telescope git status" },
    }
  end,

  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults = {
      layout_config = {
        horizontal = {
          preview_cutoff = 140,
          width = 0.95,
        },
      },
      file_ignore_patterns = { ".git/.*", ".idea/.*" , "__pycache__/.*" },
      mappings = {
        i = {
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
        },
      },
      selection_caret = " ",
      sorting_strategy = "ascending",
      winblend = 0,
    }
    opts.pickers = {
      colorscheme = { enable_preview = true },
    }
    opts.extensions = {
      file_browser = {
        hijack_netrw = true,
      },
    }
  end,

  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
  end,
}

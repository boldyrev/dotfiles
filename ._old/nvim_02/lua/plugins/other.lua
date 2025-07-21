return {
  "bluz71/vim-nightfly-colors",
  "nvim-tree/nvim-web-devicons",
  -- "slim-template/vim-slim",
  -- "tpope/vim-rails",
  -- "vim-ruby/vim-ruby",

  { "christoomey/vim-tmux-navigator", lazy = false },
  { "olimorris/onedarkpro.nvim", priority = 1000 },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }
}

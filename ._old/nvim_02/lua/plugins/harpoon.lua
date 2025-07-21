return {
  "ThePrimeagen/harpoon",
  enabled = true,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  branch = "harpoon2",

  keys = function()
    local keys = {
      {"<leader>1",
        function()
          require("harpoon"):list():select(1)
        end, desc ="Harpoon buffer 1"
      },

      {"<leader>2",
        function()
          require("harpoon"):list():select(2)
        end, desc ="Harpoon buffer 2"
      },

      {"<leader>3",
        function()
          require("harpoon"):list():select(3)
        end, desc ="Harpoon buffer 3"
      },

      {"<leader>4",
        function()
          require("harpoon"):list():select(4)
        end, desc ="Harpoon buffer 4"
      },

      {"<leader>5",
        function()
          require("harpoon"):list():select(5)
        end, desc ="Harpoon buffer 5"
      },

      {"<C-e>",
        function()
          local harpoon = require("harpoon")
         harpoon.ui:toggle_quick_menu(harpoon:list())
        end, desc ="Harpoon Toggle Menu"
      },

      {"<leader>a",
        function()
          require("harpoon"):list():add()
        end, desc ="Harpoon Tadd file"
      },
    }
    return keys
  end,

  opts = {
    settings = {
      enter_on_sendcmd = false,
      excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
      mark_branch = false,
      save_on_change = true,
      save_on_toggle = false,
      sync_on_ui_close = false,
      tmux_autoclose_windows = false,
    },
  },
}

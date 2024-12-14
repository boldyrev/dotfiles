local cmdline_opts = {
	border = {
		style = "rounded",
		text = { top = "" },
	},
}

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline_popup",
      format = {
        cmdline = { pattern = "^:", icon = "", opts = cmdline_opts },
        search_down = { kind = "Search", pattern = "^/", icon = "🔎 ", ft = "regex" },
        search_up = { kind = "Search", pattern = "^%?", icon = "🔎 ", ft = "regex" },
        input = { icon = "✏️ ", ft = "text", opts = cmdline_opts },
        calculator = { pattern = "^=", icon = "", lang = "vimnormal", opts = cmdline_opts },
        substitute = {
          pattern = "^:%%?s/",
          icon = "🔁",
          ft = "regex",
          opts = { border = { text = { top = " sub (old/new/) " } } },
        },
        filter = { pattern = "^:%s*!", icon = "$", ft = "sh", opts = cmdline_opts },
        filefilter = { kind = "Filter", pattern = "^:%s*%%%s*!", icon = "📄 $", ft = "sh", opts = cmdline_opts },
        selectionfilter = {
          kind = "Filter",
          pattern = "^:%s*%'<,%'>%s*!",
          icon = " $",
          ft = "sh",
          opts = cmdline_opts,
        },
        lua = { pattern = "^:%s*lua%s+", icon = "", conceal = true, ft = "lua", opts = cmdline_opts },
        rename = {
          pattern = "^:%s*IncRename%s+",
          icon = "✏️ ",
          conceal = true,
          opts = {
            relative = "cursor",
            size = { min_width = 20 },
            position = { row = -3, col = 0 },
            buf_options = { filetype = "text" },
            border = { text = { top = " rename " } },
          },
        },
        help = { pattern = "^:%s*h%s+", icon = "💡", opts = cmdline_opts },
      },
    },
    messages = { view_search = false },
    views = {
      split = { enter = true },
      mini = { win_options = { winblend = 100 } },
    },
    presets = {
      long_message_to_split = true,
      lsp_doc_border = true,
    },
    routes = {
      { filter = { find = "E162" }, view = "mini" },
      { filter = { event = "msg_show", kind = "", find = "written" }, view = "mini" },
      { filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
      { filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
      { filter = { event = "emsg", find = "E23" }, skip = true },
      { filter = { event = "emsg", find = "E20" }, skip = true },
      { filter = { find = "No signature help" }, skip = true },
      { filter = { find = "E37" }, skip = true },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
}

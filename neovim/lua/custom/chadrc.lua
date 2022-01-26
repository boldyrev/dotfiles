-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvbox",
}

M.plugins = {
   options = {
      statusline = {
        style = "arrow",
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}


return M

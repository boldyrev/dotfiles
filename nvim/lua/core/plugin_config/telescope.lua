require('telescope').setup {
	defaults = {
	  layout_config = {
      horizontal = {
        preview_cutoff = 140,
        width = 0.95,
      },
    },
    file_ignore_patterns = { ".git/.*", ".idea/.*" , "__pycache__/.*" },
	}
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files previewer=false hidden=true no_ignore=true<CR>', {})
-- show usage
vim.keymap.set('n', '<leader>fu', '<cmd> Telescope lsp_references show_line=false<CR>', {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', {})

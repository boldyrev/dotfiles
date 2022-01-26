-- remove trailing whitespaces on save file
vim.cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]

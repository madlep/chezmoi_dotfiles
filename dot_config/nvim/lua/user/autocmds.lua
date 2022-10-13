-- make uses tabs
vim.cmd [[ autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0 ]]

-- auto format on save
vim.cmd [[ autocmd BufWritePre *.ex,*.exs,*.rb,*.lua lua vim.lsp.buf.format()]]

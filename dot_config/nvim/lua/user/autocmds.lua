-- make uses tabs
vim.cmd([[ autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0 ]])

-- lua has 4 space indentation - lua ls needs this set
vim.cmd([[ autocmd FileType lua set shiftwidth=4 expandtab tabstop=4 softtabstop=4]])

-- auto format on save
vim.cmd([[ autocmd BufWritePre *.ex,*.exs,*.rb,*.lua,*.rs lua vim.lsp.buf.format()]])

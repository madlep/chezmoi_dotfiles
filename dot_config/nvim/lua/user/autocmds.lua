-- make uses tabs
vim.cmd([[ autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0 ]])

-- lua has 4 space indentation - lua ls needs this set
vim.cmd([[ autocmd FileType lua set shiftwidth=4 expandtab tabstop=4 softtabstop=4]])

-- go uses tabs
vim.cmd([[ autocmd FileType go set noexpandtab shiftwidth=4 softtabstop=0 ]])

-- auto format on save
vim.cmd([[ autocmd BufWritePre *.ex,*.exs,*.rb,*.lua,*.rs,*.go,*.ts lua vim.lsp.buf.format()]])
--
-- hide cursorline on inactive window
vim.cmd([[
  " don't enable/disable cursor on these filetypes
  let ignorecursorlineft = ['NvimTree']

  augroup MyCursorLineGroup
      autocmd!
      au WinEnter * if index(ignorecursorlineft, &ft) < 0 | setlocal cursorline cursorcolumn | endif
      au WinLeave * if index(ignorecursorlineft, &ft) < 0 | setlocal nocursorline nocursorcolumn | endif
  augroup end
]])

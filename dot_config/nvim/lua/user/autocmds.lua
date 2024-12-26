-- auto format on save
vim.cmd([[ autocmd BufWritePre *.ex,*.exs,*.rb,*.lua,*.rs,*.go lua vim.lsp.buf.format()]])

-- force using eslint as ts-ls uses wrong formatting sometimes
vim.cmd([[ autocmd BufWritePre *.ts lua vim.lsp.buf.format({name = "eslint"})]])
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

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

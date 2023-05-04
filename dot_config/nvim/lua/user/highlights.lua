-- gh PR main body text, get rid of annoying underlining
vim.cmd([[ hi LTSymbol gui=none ]])

-- hide cursorline on inactive window
vim.cmd([[
  augroup MyCursorLineGroup
      autocmd!
      au WinEnter * setlocal cursorline
      au WinLeave * setlocal nocursorline
  augroup end
]])

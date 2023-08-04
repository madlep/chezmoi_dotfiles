-- gh PR main body text, get rid of annoying underlining
vim.cmd([[ hi LTSymbol gui=none ]])

vim.cmd([[
  hi! link ColorColumn CursorLine
]])

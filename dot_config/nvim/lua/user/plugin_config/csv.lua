-- is a vimscript plugin, so doesn't need usual lua require(...).setup({})

-- make shift-h and shift-l still work to navigate through buffers even in .csv files
vim.cmd([[
  let g:csv_nomap_h = 1
  let g:csv_nomap_l = 1
]])

local lsp_lines = require("lsp_lines")

lsp_lines.setup()

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})
require("user.lsp.configs")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

-- auto format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

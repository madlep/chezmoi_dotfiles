require("user.lsp.ui")
require("user.lsp.lspconfig")
require("user.lsp.null-ls")
require("user.lsp.codelens").setup()

-- auto format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

local ok, null_ls = pcall(require, "null-ls")
if not ok then
    vim.notify("couldn't load null-ls")
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

-- be careful adding functionality provided by a non-LSP util via null-ls, and
-- the same thing from a proper LSP server, as things get weird and/or have
-- repeated diagnostics etc
null_ls.setup({
    debug = false,
    sources = {
        actions.shellcheck,
        diagnostics.codespell.with(require("user.lsp.null-ls.codespell").setup()),
        diagnostics.credo.with(require("user.lsp.null-ls.credo").setup()),
        diagnostics.gitlint,
        diagnostics.jsonlint,
        diagnostics.proselint,
        diagnostics.selene,
        diagnostics.shellcheck,
        -- diagnostics.yamllint,
        diagnostics.zsh,
        formatting.jq,
        formatting.prettier.with(require("user.lsp.null-ls.prettier").setup()),
        formatting.rustfmt,
        formatting.stylua,
    },
    update_in_insert = false,
    default_timeout = 10000, -- milliseconds
})

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

-- from https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#code
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = false,
  sources = {
    actions.shellcheck,

    diagnostics.credo,
    diagnostics.codespell,
    diagnostics.flake8,
    diagnostics.jsonlint,
    diagnostics.markdownlint,
    diagnostics.proselint,
    diagnostics.rubocop,
    diagnostics.semgrep,
    diagnostics.shellcheck,
    diagnostics.yamllint,

    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.jq,
    formatting.mix,
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.rubocop,
  },
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  --         vim.lsp.buf.formatting_sync()
  --       end,
  --     })
  --   end
  -- end,
})

local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    actions.shellcheck,

    diagnostics.codespell,
    diagnostics.credo,
    diagnostics.gitlint,
    diagnostics.jsonlint,
    diagnostics.proselint,
    diagnostics.shellcheck,
    diagnostics.yamllint,
    diagnostics.zsh,

    formatting.jq,
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
  },
})

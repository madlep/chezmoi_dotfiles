-- work around due to neovim not having any way to hide codelens (ie Elixir spec suggestions)
local M = {}

local old_display = vim.lsp.codelens.display

M.codelens_enabled = true

M.setup = function()
  vim.lsp.codelens.display = function(lenses, bufnr, client_id)
    if not M.codelens_enabled then
      local ns = vim.lsp.codelens.__namespaces[client_id]
      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
    else
      old_display(lenses, bufnr, client_id)
    end
  end
end

M.toggle_codelens = function()
  M.codelens_enabled = not M.codelens_enabled
  vim.lsp.codelens.refresh()
end


return M

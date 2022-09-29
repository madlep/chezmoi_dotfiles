-- work around due to neovim not having any way to hide codelens (ie Elixir spec suggestions)
local M = {}

local orig_display = vim.lsp.codelens.display

M.codelens_enabled = true

local codelens_display_override = function(lenses, bufnr, client_id)
  if not M.codelens_enabled then
    local ns = vim.lsp.codelens.__namespaces[client_id]
    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
  else
    orig_display(lenses, bufnr, client_id)
  end

end

M.setup = function()
  vim.lsp.codelens.display = codelens_display_override
end

M.enable = function()
  M.codelens_enabled = true
  vim.notify("Showing codelenses")
  vim.lsp.codelens.refresh()
end

M.disable = function()
  M.codelens_enabled = false
  vim.notify("Hiding codelenses")
  vim.lsp.codelens.refresh()
end

M.toggle = function()
  if M.codelens_enabled then
    M.disable()
  else
    M.enable()
  end
end

return M

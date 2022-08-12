-- default servers we always want
local servers = {
  "jsonls",
  "sumneko_lua",
  "solargraph",
  "elixirls",
}

local installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_ok then
  return
end

local config_ok, lspconfig = pcall(require, "lspconfig")
if not config_ok then
  print("couldn't find lspconfig")
  return
end

lsp_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end

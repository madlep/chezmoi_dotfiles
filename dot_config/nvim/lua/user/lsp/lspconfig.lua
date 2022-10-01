local server_config_paths = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/user/lsp/lspconfig", [[v:val =~ "\.lua$"]])
local servers = {}
local server_names = {}
for _, server_config_path in ipairs(server_config_paths) do
  local server_name = server_config_path:gsub("%.lua$", '')
  local server = require("user.lsp.lspconfig." .. server_name)
  servers[server_name] = server
  if not server.manual_managed then
    table.insert(server_names, server_name)
  end
end

require("nvim-lsp-installer").setup { ensure_installed = server_names }

local cfg = require("lspconfig")

local on_attach = function(_, bufnr)
  require("user.keymaps").lsp_keymaps(bufnr) -- custom key maps defined in user/keymaps.lua
  vim.lsp.codelens.refresh()
  -- workaround to refresh codelens in case it doesn't show up automatically
  vim.defer_fn(vim.lsp.codelens.refresh, 5000)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for server_name, server in pairs(servers) do
  local default_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  local opts = vim.tbl_deep_extend("force", default_opts, server)
  cfg[server_name].setup(opts)
end

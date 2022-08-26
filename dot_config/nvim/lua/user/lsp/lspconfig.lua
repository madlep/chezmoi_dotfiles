local server_config_paths = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/user/lsp/lspconfig", [[v:val =~ "\.lua$"]])
local servers = {}
for i, server_config_path in ipairs(server_config_paths) do
  servers[i] = server_config_path:gsub("%.lua$", '')
end

require("nvim-lsp-installer").setup { ensure_installed = servers }

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  require("user.keymaps").lsp_keymaps(bufnr) -- custom key maps defined in user/keymaps.lua
  require("illuminate").on_attach(client) -- set up illuminate to highlight word under cursor
  if client.resolved_capabilities.code_lens then
    -- workaround to refresh codelens in case it doesn't show up automatically
    vim.defer_fn(vim.lsp.codelens.refresh, 5000)
  end
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in pairs(servers) do
  lspconfig[server].setup(
    vim.tbl_deep_extend(
      "force",
      {
        on_attach = on_attach,
        capabilities = capabilities,
      },
      require("user.lsp.lspconfig." .. server)
    )
  )
end

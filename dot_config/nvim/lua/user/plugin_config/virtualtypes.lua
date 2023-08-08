local virtualtypes = require("virtualtypes")

local M = {}

function M.on_attach(client, bufnr)
    if client.supports_method("textDocument/codeLens") then
        virtualtypes.on_attach(client, bufnr)
    end
end

return M

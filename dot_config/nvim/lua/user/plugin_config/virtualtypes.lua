local virtualtypes = require("virtualtypes")

local M = {}

function M.on_attach(client, bufnr)
    virtualtypes.on_attach(client, bufnr)
end

return M

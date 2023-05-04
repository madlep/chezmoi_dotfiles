local M = {}

local methods = require("null-ls.methods")

M.setup = function()
    return {
        timeout = 20000,
        condition = function(utils)
            return utils.has_file(".credo.exs") or utils.root_has_file(".credo.exs")
        end,
        method = methods.DIAGNOSTIC_ON_SAVE,
        extra_args = { "--strict" },
        config = {
            full_workspace = true,
        },
    }
end

return M

local M = {}

M.setup = function()
    return {
        extra_args = { "-L", "crate" },
        disabled_filetypes = { "NvimTree" },
    }
end

return M

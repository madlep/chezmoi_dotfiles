require("neotest").setup({
    adapters = {
        require("neotest-elixir"),
        require("neotest-go"),
    },
    quickfix = {
        enabled = true,
        open = true,
    },
    status = {
        enabled = true,
        signs = true,
        virtual_text = true,
    },
})

local neotest_ns = vim.api.nvim_create_namespace("neotest")

vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
        end,
    },
}, neotest_ns)

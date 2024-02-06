local util = require("lspconfig/util")

-- workaround for startup error from https://github.com/fwcd/kotlin-language-server/issues/546#issuecomment-1919929778
local storage_path = util.path.join(vim.fn.stdpath("data"), "kotlin-language_server")
vim.fn.mkdir(storage_path, "p")

return {
    init_options = {
        storagePath = storage_path,
    },
    settings = {},
    -- disabled = true,
}

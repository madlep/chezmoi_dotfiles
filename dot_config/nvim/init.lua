-- impatient is first, so it can cache and speed up load time
local ok, _ = pcall(require, "impatient")
if not ok then
    vim.notify("couldn't load plugin impatient")
end

-- set colorscheme before plugins, because highlights can get messed up otherwise (bufferline separators etc)
require("user.colorscheme")

-- user/plugins.rb will load everything in user/plugin_config/*.lua
require("user.plugins")

-- regular setup
require("user.autocmds")
require("user.diagnostic")
require("user.folding")
require("user.highlights")
require("user.keymaps")
require("user.lsp")
require("user.options")

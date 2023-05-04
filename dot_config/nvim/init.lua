-- impatient is first, so it can cache and speed up load time
require("impatient")

-- user/plugins.rb will load everything in user/plugin_config/*.lua
require("user.plugins")

-- regular setup
require("user.autocmds")
require("user.colorscheme")
require("user.highlights")
require("user.keymaps")
require("user.lsp")
require("user.options")

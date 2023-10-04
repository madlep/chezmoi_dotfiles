local lspsaga = require("lspsaga")
local keymaps = require("user.keymaps").lspsaga_keymaps()

local config = {}

lspsaga.setup(vim.tbl_deep_extend("error", config, keymaps))
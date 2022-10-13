local configs = require("nvim-treesitter.configs")

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.markdown.filetype_to_parsername = "octo"

configs.setup {
  ensure_installed = "all",
  auto_install = true,
  sync_install = false,
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing. phpdoc fails with error I don't care about, so just kill it.
  highlight = {
    enable = true,
    disable = { "" }, -- languages to disable TS for
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "" }
  },
  rainbow = {
    enable = true,
    disable = { "" }, -- disabled for languages
    extended_mode = true, -- Also highlight non bracket delimiters
    max_file_lines = nil, -- disable for files longer than
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of color name strings
  },
}

-- treesitter folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

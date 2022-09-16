local onenord = require("onenord")
onenord.setup({
  fade_nc = true,
  styles = {
    functions = "bold",
  }
})

local tokyonight = require("tokyonight")
tokyonight.setup({
  style = "storm",
  styles = {
    functions = "bold",
    sidebars = "dark",
  },
  sidebars = { "qf", "help", "Outline" },
})

vim.cmd [[
  colorscheme tokyonight
]]

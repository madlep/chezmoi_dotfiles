vim.cmd [[
try
  colorscheme onenord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

local onenord = require('onenord')

onenord.setup({
  fade_nc = true,
  styles = {
    functions = "bold",
  }
})

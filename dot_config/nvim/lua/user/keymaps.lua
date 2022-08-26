local wk = require("which-key") -- to register leader key labels for which key help

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- misc overrides
keymap("n", "z=", "<cmd>:Telescope spell_suggest<CR>", opts)

-- indent/unindent
keymap("n", "<Left>", "<<", opts)
keymap("n", "<Right>", ">>", opts)
keymap("v", "<Left>", "<gv", opts)
keymap("v", "<right>", ">gv", opts)

-- Move text up and down
keymap("n", "<Up>", ":m .-2<CR>", opts)
keymap("n", "<Down>", ":m .+1<CR>", opts)
keymap("v", "<Up>", ":m .-2<CR>", opts)
keymap("v", "<Down>", ":m .+1<CR>", opts)
keymap("v", "p", '"_dP', opts)
keymap("x", "<Up>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<Down>", ":move '>+1<CR>gv-gv", opts)

-- buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
wk.register({
  name = "Buffer",
  b = { ":Bdelete<CR>", "Delete buffer" },
  t = { ":BufferLineTogglePin<CR>", "Pin buffer" }
}, { prefix = "<leader>b" })

-- searching
wk.register({
  name = "Find",
  f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find files by name" },
  g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Search" },
  a = { "<cmd>lua require('telescope.builtin').grep_string()<CR>", "Search string under cursor" },
  b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Search buffers" },
  r = { "<cmd>lua require('telescope.builtin').resume()<CR>", "Resume previous" },
  ["/"] = { ":nohlsearch<CR>", "Clear search highlights" },
}, { prefix = "<leader>f" })


-- nvim tree
wk.register({
  name = "File tree",
  t = { ":NvimTreeToggle<CR>", "Toggle Tree" },
  f = { ":NvimTreeFindFile<CR>", "Focus on current file" }
}, { prefix = "<leader>t" })

-- diagnostics
wk.register({
  name = "diagnostics",
  d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Document diagnostics" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace diagnostics" },
  x = { "<cmd>TroubleToggle<cr>", "Toggle trouble list" },
}, { prefix = "<leader>x" })

return {
  -- keymaps that are set up when a language server is attached to the buffer from user.lsp.handler
  lsp_keymaps = function(bufnr)
    wk.register({
      name = "language server",
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
      r = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "Show references" },
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover info" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
      l = { "<cmd>lua require('lsp_lines').toggle()<CR>", "Toggle diagnostics" },
      c = {
        name = "Codelens",
        r = { "<cmd>lua vim.lsp.codelens.run()<CR>", "Run codelens" },
        t = { "<cmd>lua require('user.lsp.codelens').toggle()<CR>", "Toggle codelens" }
      },
    }, { prefix = "<leader>l", buffer = bufnr })
  end
}

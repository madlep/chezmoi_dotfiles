local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- indent/unindent
keymap("n", "<Left>", "<<", opts)
keymap("n", "<Right>", ">>", opts)

-- Move text up and down
keymap("n", "<Up>", ":m .-2<CR>", opts)
keymap("n", "<Down>", ":m .+1<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- clear search highlight
keymap("n", "<leader>,/", ":nohlsearch<CR>", opts)

-- Insert --
-- Press jk fast leave insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- indent/unindent
keymap("v", "<Left>", "<gv", opts)
keymap("v", "<right>", ">gv", opts)

-- Move text up and down
keymap("v", "<Up>", ":m .-2<CR>", opts)
keymap("v", "<Down>", ":m .+1<CR>", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<Up>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<Down>", ":move '>+1<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- nvim tree
keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<CR>", opts)

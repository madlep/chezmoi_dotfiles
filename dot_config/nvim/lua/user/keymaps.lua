local ok, wk = pcall(require, "which-key") -- to register leader key labels for which key help
if not ok then
    vim.notify("couldn't load which-key")
    return
end

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
keymap("n", "<S-l>", "<cmd>lua require('user.buffer').safe_bnext()<CR>", opts)
keymap("n", "<S-h>", "<cmd>lua require('user.buffer').safe_bprev()<CR>", opts)
wk.register({
    name = "Buffer",
    b = { ":Bdelete<CR>", "Delete buffer" },
    t = { ":BufferLineTogglePin<CR>", "Pin buffer" },
    o = { ":%bd|e#|bd#<CR>", "Close other buffers" },
}, { prefix = "<leader>b" })

-- searching
wk.register({
    name = "Find",
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find files by name" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Search" },
    t = { "<cmd>lua require('telescope.builtin').builtin()<CR>", "Telescope builtins" },
    a = { "<cmd>lua require('telescope.builtin').grep_string()<CR>", "Search string under cursor" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Search buffers" },
    r = { "<cmd>lua require('telescope.builtin').resume()<CR>", "Resume previous" },
    h = { ":Telescope harpoon marks<CR>", "harpoon marks" },
    d = {
        name = "dir-telescope",
        f = { "<cmd>Telescope dir find_files<CR>", "Find files in dir by name" },
        g = { "<cmd>Telescope dir live_grep<CR>", "Search in dir" },
    },
    s = {
        name = "spectre (search/replace)",
        g = { "<cmd>lua require('spectre').open()<CR>", "Global search/replace" },
        f = { "<cmd>lua require('spectre').open_file_search()<CR>", "File search/replace" },
    },
    ["/"] = { ":nohlsearch<CR>", "Clear search highlights" },
}, { prefix = "<leader>f" })

-- harpoon navigation
wk.register({
    name = "Harpoon",
    h = { "<cmd>lua require('harpoon.mark').toggle_file()<CR>", "toggle harpoon mark" },
    f = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "add harpoon mark" },
    d = { "<cmd>lua require('harpoon.mark').rm_file()<CR>", "remove harpoon mark" },
    D = { "<cmd>lua require('harpoon.mark').clear_all()<CR>", "clear all harpoon marks" },
    q = { "<cmd>lua require('harpoon.mark').to_quickfix_list()<CR>:copen<CR>", "open harpoon marks in quicklist" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "next harpoon" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "prev harpoon" },
}, { prefix = "<leader>h" })

-- use beacon for search navigation in docs
keymap("n", "<leader><leader>", ":Beacon<cr>", opts)
keymap("n", "n", "n:Beacon<cr>", opts)
keymap("n", "N", "N:Beacon<cr>", opts)
keymap("n", "*", "*:Beacon<cr>", opts)
keymap("n", "#", "#:Beacon<cr>", opts)

-- nvim tree
wk.register({
    name = "Directory tree",
    d = { ":NvimTreeToggle<CR>", "Toggle Tree" },
    f = { ":NvimTreeFindFile<CR>", "Focus on current file" },
}, { prefix = "<leader>d" })

-- diagnostics
wk.register({
    name = "diagnostics",
    d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Document diagnostics" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace diagnostics" },
    x = { "<cmd>TroubleToggle<cr>", "Toggle trouble list" },
    f = {
        "<cmd>lua vim.diagnostic.open_float({focus = true, focusable = true, height = 50, width = 120})<CR>",
        "Open diagnostic float",
    },
    p = { vim.diagnostic.goto_prev, "Go to previous diagnostic message" },
    n = { vim.diagnostic.goto_next, "Go to next diagnostic message" },
    q = { vim.diagnostic.setloclist, "Open diagnostic quickfix list" },
}, { prefix = "<leader>x" })

-- git
wk.register({
    name = "git",
    t = { "<cmd>:GitBlameToggle<CR>", "toggle blame" },
    o = { "<cmd>:GitBlameOpenCommitURL<CR>", "open commit in browser" },
    y = { "<cmd>:GitBlameCopySHA<CR>", "copy commit SHA to clipboard" },
    c = { "<cmd>:Telescope git_commits<CR>", "repo git commits" },
    b = { "<cmd>:Telescope git_bcommits<CR>", "buffer git commits" },
    x = { "<cmd>:GitConflictListQf<CR>", "conflict list" },
    [">"] = { "<cmd>:GitConflictChooseTheirs<CR>", "conflict - choose THEIR'S" },
    ["<"] = { "<cmd>:GitConflictChooseOurs<CR>", "conflict - choose OUR'S" },
    p = {
        name = "Octo pr",
        l = { "<cmd>:Octo pr list<CR>", "Octo pr list" },
        c = { "<cmd>:Octo pr checkout<CR>", "Octo pr checkout" },
        h = { "<cmd>:Octo pr changes<CR>", "Octo pr changes" },
        d = { "<cmd>:Octo pr diff<CR>", "Octo pr diff" },
        m = { "<cmd>:Octo pr commits<CR>", "Octo pr commits" },
    },
}, { prefix = "<leader>g" })

-- tests
wk.register({
    name = "test",
    t = { "<cmd>lua require('neotest').summary.toggle()<CR>", "test summary" },
    a = { "<cmd>lua require('neotest').run.run({suite = true})<CR>", "run all tests" },
    r = {
        function()
            local other = require("other-nvim")
            local neotest = require("neotest")

            neotest.summary.open()
            neotest.output_panel.open()
            other.open("test")
            neotest.run.run(vim.fn.expand("%"))
        end,
        "run current test",
    },
    n = { "<cmd>lua require('neotest').run.run()<CR>", "run nearest test" },
}, { prefix = "<leader>t" })

-- other file
wk.register({
    o = { "<cmd>:Other<CR>", "open other file" },
    t = { "<cmd>:Other test<CR>", "open test file" },
}, { prefix = "<leader>o" })

wk.register({
    o = { "<cmd>:AerialToggle right<CR>", "Outline toggle" },
}, { prefix = "<leader>l" })

return {
    -- keymaps that are set up when a language server is attached to the buffer from user.lsp.handler
    lsp_keymaps = function(bufnr)
        wk.register({
            -- ["<C-k>"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover" },
            gd = { "<cmd>lua vim.lsp.buf.definition()<CR>", "go to LSP definition" },
        })
        wk.register({
            name = "language server",
            d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
            r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show references" },
            h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover info" },
            D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
            i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation" },
            s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
            l = {
                function()
                    require("lsp_lines").toggle()
                    vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
                end,
                "Diagnostics toggle",
            },
            n = {
                "<cmd>lua vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())<CR>",
                "Inlay hint toggle",
            },
            -- o = { "<cmd>:SymbolsOutline<CR>", "Outline toggle" },
            -- o = { "<cmd>:AerialToggle right<CR>", "Outline toggle" },
            c = {
                name = "Codelens",
                r = { "<cmd>lua vim.lsp.codelens.run()<CR>", "Run codelens" },
                t = { "<cmd>lua require('user.lsp.codelens').toggle()<CR>", "Toggle codelens" },
            },
            -- [">"] = { "<cmd>:Lspsaga incoming_calls<CR>", "incoming calls" },
            -- ["<"] = { "<cmd>:Lspsaga outgoing_calls<CR>", "outgoing calls" },
        }, { prefix = "<leader>l", buffer = bufnr })
    end,

    -- lspsaga_keymaps = function()
    --     return {
    --         outline = {
    --             keys = {
    --                 jump = "<CR>",
    --             },
    --         },
    --         callhierarchy = {
    --             keys = {
    --                 toggle_or_req = "o",
    --             },
    --         },
    --     }
    -- end,
}

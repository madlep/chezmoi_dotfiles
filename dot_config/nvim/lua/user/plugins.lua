-- https://github.com/wbthomason/packer.nvim

------------------------
-- Plugins start here...
------------------------
local plugins = function(use)
    -- general
    use("nvim-lua/plenary.nvim") -- useful lua functions used by everything
    use("moll/vim-bbye") -- make buffer/window management less janky
    use("lewis6991/impatient.nvim") -- optimise loading of lua plugins at startup
    use("folke/which-key.nvim") -- key binding helpers
    use("chrisbra/csv.vim") -- CSV editing
    use("kevinhwang91/nvim-bqf") -- better quick fix
    use("machakann/vim-sandwich") -- add/delete surrounding ({[]}) etc
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "jfpedroza/neotest-elixir",
            "nvim-neotest/neotest-go",
        },
    }) -- testing
    use("rgroli/other.nvim") -- code/test alternate file switching

    -- UI
    use("alexghergh/nvim-tmux-navigation") -- use <C-h><C-j> etc to move between tmux windows and neovim
    -- use("p00f/nvim-ts-rainbow") -- render rainbow open/close markers for brackets etc TODO errors, and unmaintained
    use("akinsho/bufferline.nvim") -- nicer buffer list at top
    use("nvim-lualine/lualine.nvim") -- nicer line at bottom of the screen
    use("lukas-reineke/indent-blankline.nvim") -- show vertical tab markers for indentation level
    use("folke/trouble.nvim") -- report workspace wide diagnostics/warnings/errors
    use("RRethy/vim-illuminate") -- highlight word under cursor throughout doc
    use("danilamihailov/beacon.nvim") -- flash cursor line on movements

    -- git
    use("lewis6991/gitsigns.nvim") -- show change status in left margin
    use("f-person/git-blame.nvim") -- show gitblame
    use({ "akinsho/git-conflict.nvim", tag = "*" }) -- navigate merge conflicts
    use({
        "pwntester/octo.nvim",
        requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "kyazdani42/nvim-web-devicons" },
    }) -- github PR management
    use({ "ldelossa/gh.nvim", requires = { { "ldelossa/litee.nvim" } } }) -- also github/PR management

    -- themes
    use("folke/tokyonight.nvim")
    -- use "rmehri01/onenord.nvim"
    -- use "arcticicestudio/nord-vim"

    -- nvim-tree
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- completions
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("hrsh7th/cmp-nvim-lsp") -- LSP completions
    use("hrsh7th/cmp-nvim-lua") -- completions for neovim API itself
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- LSP function signature completion

    -- snippets
    -- TODO fix weird behaviour with custom tabbing
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")

    -- Language Server Protocol
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim") -- manage LSP installs
    use("williamboman/mason-lspconfig.nvim") -- install/manage language servers from within neovim UI
    use("jose-elias-alvarez/null-ls.nvim") -- used by external CLI formatters/linters to hook into Neovim's LSP
    use("jubnzv/virtual-types.nvim") -- show virtual types hint
    use("simrat39/symbols-outline.nvim") -- list functions/modules etc for buffer in side window
    use("https://git.sr.ht/~whynothugo/lsp_lines.nvim") -- show inline LSP diagnostics
    use({
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
    }) -- show breadcrumbs to location in LSP hierarchy under cursor
    use("stevearc/aerial.nvim")

    -- use("nvimdev/lspsaga.nvim")
    -- use("~/src/opensource/lspsaga.nvim")

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-refactor")
    use("nvim-treesitter/nvim-treesitter-context")
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("nvim-treesitter/playground")
    use("haringsrob/nvim_context_vt")

    -- search / navigation
    use({
        "junegunn/fzf",
        run = function()
            vim.fn["fzf#install"]()
        end,
    }) -- fuzzy finder
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    })
    use("nvim-telescope/telescope-ui-select.nvim")
    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }) -- telescope UI
    use({
        "princejoogie/dir-telescope.nvim",
        -- telescope.nvim is a required dependency
        requires = { "nvim-telescope/telescope.nvim" },
    }) -- telescope search for filename / content WITHIN dir
    use("nvim-pack/nvim-spectre") -- global search / rename
    use("ThePrimeagen/harpoon")

    -- language specific
    use("sirosen/vim-rockstar") -- rock star syntax highlighting
end
------------------------
-- ...Plugins end here
------------------------

-- Automatically install packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

local plugin_config_paths = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/user/plugin_config", [[v:val =~ "\.lua$"]])
for _, plugin_config_path in ipairs(plugin_config_paths) do
    local plugin_config_name = plugin_config_path:gsub("%.lua$", "")
    local ok, err = pcall(require, "user.plugin_config." .. plugin_config_name)
    if not ok then
        vim.notify("couldn't load plugin config for: " .. plugin_config_name .. "err=" .. err)
    end
end

-- Install plugins
return packer.startup(function(use)
    -- packer can self manage
    use("wbthomason/packer.nvim")
    plugins(use)

    if packer_bootstrap then
        require("packer").sync()
    end
end)

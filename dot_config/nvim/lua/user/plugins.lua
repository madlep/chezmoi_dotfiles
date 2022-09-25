-- https://github.com/wbthomason/packer.nvim

------------------------
-- Plugins start here...
------------------------
local plugins = function(use)
  -- general
  use "nvim-lua/plenary.nvim" -- useful lua functions used by everything
  use "alexghergh/nvim-tmux-navigation" -- use <C-h><C-j> etc to move between tmux windows and neovim
  use "p00f/nvim-ts-rainbow" -- rainbow open/close markers for brackets etc
  use "windwp/nvim-autopairs" -- auto close brackets etc
  use "lewis6991/gitsigns.nvim" -- show change status in left margin
  use "akinsho/bufferline.nvim" -- nicer buffer list at top
  use "moll/vim-bbye" -- make buffer/window management less janky
  use "nvim-lualine/lualine.nvim" -- nicer line at bottom of the screen
  use "lewis6991/impatient.nvim" -- optimise loading of lua plugins at startup
  use "lukas-reineke/indent-blankline.nvim" -- show vertical tab markers for indentation level
  use "folke/trouble.nvim" -- report workspace wide diagnostics/warnings/errors
  use "f-person/git-blame.nvim" -- show gitblame
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  use "folke/which-key.nvim"
  use "chrisbra/csv.vim"
  use "kevinhwang91/nvim-bqf"
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use "nvim-pack/nvim-spectre"
  use { 'pwntester/octo.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'kyazdani42/nvim-web-devicons', } }
  use { 'ldelossa/gh.nvim', requires = { { 'ldelossa/litee.nvim' } } }
  use "rmagatti/auto-session"

  -- themes
  use "folke/tokyonight.nvim" -- current
  use "rmehri01/onenord.nvim"
  use "arcticicestudio/nord-vim"

  -- nvim-tree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- completions
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "hrsh7th/cmp-nvim-lua" -- completions for neovim API itself
  use "hrsh7th/cmp-nvim-lsp-signature-help" -- LSP function signature completion

  -- snippets
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "L3MON4D3/LuaSnip" -- snippet engine

  -- Language Server Protocol
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer" -- install/manage language servers from within neovim UI
  use "jose-elias-alvarez/null-ls.nvim" -- used by external CLI formatters/linters to hook into Neovim's LSP
  use "jubnzv/virtual-types.nvim" -- show virtual types hint
  use "simrat39/symbols-outline.nvim" -- list functions/modules etc for buffer in side window

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "nvim-treesitter/nvim-treesitter-context"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "nvim-treesitter/playground"
  use "haringsrob/nvim_context_vt"

  -- Telescope
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use "nvim-telescope/telescope-ui-select.nvim"
end
------------------------
-- ...Plugins end here
------------------------




-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path, })
  print("Installing packer. Close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

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

-- Install plugins
return packer.startup(function(use)
  -- packer can self manage
  use "wbthomason/packer.nvim"
  plugins(use)
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

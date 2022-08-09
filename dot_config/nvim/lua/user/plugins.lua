-- https://github.com/wbthomason/packer.nvim

------------------------
-- Plugins start here...
------------------------
local plugins = function(use)
  use "nvim-lua/plenary.nvim" -- useful lua functions used by everything
  use "arcticicestudio/nord-vim" -- current theme
  use "alexghergh/nvim-tmux-navigation" -- use <C-h><C-j> etc to move between tmux windows and neovim

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- completions
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "hrsh7th/cmp-nvim-lua" -- completions for neovim API itself

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- snippet completions

  -- Language Server Protocol
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer" -- install/manage language servers from within neovim UI
  use "jose-elias-alvarez/null-ls.nvim" -- used by formatters/linters to hook into Neovim's LSP

  use {"nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end
------------------------
-- ...Plugins end here
------------------------




-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path,})
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

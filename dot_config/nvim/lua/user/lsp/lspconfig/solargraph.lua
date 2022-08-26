-- work around from https://github.com/williamboman/nvim-lsp-installer/issues/187#issuecomment-1100960546
-- solargraph can't find application bundled gems in asdf etc ruby installation otherwise
-- need to run this in each application initially, and when gems change
-- this doesn't separate gem installation for different ruby versions, so will probably break if multiple apps with different ruby versions all try to use solargraph
vim.cmd([[
command! SolargraphBundleInstall !GEM_HOME="$HOME/.local/share/nvim/lsp_servers/solargraph" GEM_PATH="$HOME/.local/share/nvim/lsp_servers/solargraph" bundle install
]])
-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])

return {
  settings = {
    solargraph = {
      useBundler = true,
    },
  },
}

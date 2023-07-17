local ok, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
if not ok then
    vim.notify("Couldn't set colorscheme")
end
-- vim.cmd([[
--   colorscheme tokyonight-night
-- ]])

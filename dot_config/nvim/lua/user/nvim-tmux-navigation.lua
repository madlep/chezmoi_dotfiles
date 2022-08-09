local status_ok, ntn = pcall(require, "nvim-tmux-navigation")
if not status_ok then
  return
end

ntn.setup {
  disable_when_zoomed = true,
  keybindings = {
    left  = "<C-h>",
    down  = "<C-j>",
    up    = "<C-k>",
    right = "<C-l>",
    last_active = "<C-\\>",
    next = "<C-space>",
  }
}

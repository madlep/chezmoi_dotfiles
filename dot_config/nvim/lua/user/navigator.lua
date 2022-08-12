local status_ok, navigator = pcall(require, "lualine")
if not status_ok then
  return
end

navigator.setup()

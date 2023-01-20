local M = {}

M.setup = function()
  return {
    extra_args = { "-L", "crate" }
  }
end

return M

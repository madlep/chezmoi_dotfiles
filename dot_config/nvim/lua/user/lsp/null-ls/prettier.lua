local M = {}

M.setup = function()
  return {
    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" }
  }
end

return M

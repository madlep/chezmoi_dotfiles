local M = {}

M.setup = function()
  return {
    condition = function(utils)
      return utils.has_file(".credo.exs") or utils.root_has_file(".credo.exs")
    end
  }
end

return M

local M = {}

local methods = require("null-ls.methods")

local DIAGNOSTICS_ON_SAVE = methods.internal.DIAGNOSTICS_ON_SAVE

M.setup = function()
  return {
    timeout = 20000,
    condition = function(utils)
      return utils.has_file(".credo.exs") or utils.root_has_file(".credo.exs")
    end,
    method = DIAGNOSTICS_ON_SAVE,
    extra_args = { "--strict" }
  }
end

return M

local spectre = require("spectre")

spectre.setup({
  replace_engine = {
    ["sed"] = {
      cmd = "gsed"
    }
  }
})

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}


local filetype = {
  "filetype",
  colored = true,
  icons_enabled = true,
  icon = { align = 'right' },
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  cond = hide_in_width,
}

local location = {
  "location",
  padding = 0,
}

local filename = {
  "filename",
  colored = true,
  file_status = true,
  new_file_status = true,
  path = 1,
  symbols = {
    modified = "",
    readonly = "",
    unnamed = "",
    newfile = "",
  }
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { filename },
    lualine_b = { filetype },
    lualine_c = { diagnostics, branch, diff },
    lualine_x = { mode },
    lualine_y = { location },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {
    "nvim-tree"
  },
})

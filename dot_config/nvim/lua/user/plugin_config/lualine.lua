local lualine = require("lualine")

local show_in_width = function()
    return vim.fn.winwidth(0) > 100
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
    cond = show_in_width,
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
    icon = { align = "right" },
    cond = show_in_width,
}

local branch = {
    "branch",
    icons_enabled = true,
    colored = true,
    icon = "",
    cond = show_in_width,
}

local location = {
    "location",
    padding = 0,
    cond = show_in_width,
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
    },
}

local navic = {
    "navic",
    color_correction = "dynamic",
    navic_opts = nil,
    cond = require("nvim-navic").is_available,
    draw_empty = true,
}

-- local gb = require("gitblame")
-- local gitblame = {
--     gb.get_current_blame_text,
--     cond = function()
--         return gb.is_blame_text_available() and show_in_width()
--     end,
-- }

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { filename },
        lualine_b = { filetype },
        lualine_c = { diagnostics },
        lualine_x = { diff, branch },
        lualine_y = { mode },
        lualine_z = { location, "progress" },
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
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { navic },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {
        "nvim-tree",
    },
})

-- treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

function CustomFoldtext()
    local start_line = vim.fn.getline(vim.v.foldstart)
    local end_line = vim.fn.getline(vim.v.foldend)
    local num_lines = vim.v.foldend - vim.v.foldstart

    local prefix, start_line = start_line:match("^(%s*%s%s)(.*)")
    if prefix then
        prefix = prefix:gsub("^(%s*)%s%s$", "%1> ")
    end

    return {
        { prefix,                              "Comment" },
        { start_line,                          "Folded" },
        { ' ... (' .. num_lines .. ' lines) ', "Comment" },
        { end_line:gsub("^%s*", ""),           "Folded" }
    }
end

vim.opt.foldtext = "v:lua.CustomFoldtext()"
vim.opt.fillchars:append({ fold = " " })

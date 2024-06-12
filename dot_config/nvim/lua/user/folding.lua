-- treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

function CustomFoldtext()
    local start_line = vim.fn.getline(vim.v.foldstart)

    -- folds have to be spaces, so convert from tabs, otherwise display is messed up
    local tab2space = string.rep(" ", vim.fn.shiftwidth())
    start_line = start_line:gsub("\t", tab2space)

    -- put a "> " before the fold if there is room
    local prefix = ""
    prefix, start_line = start_line:match("^(%s*%s%s)(.*)")
    if prefix then
        prefix = prefix:gsub("^(%s*)%s%s$", "%1> ")
    end

    local num_lines = vim.v.foldend - vim.v.foldstart - 1

    local line_s
    if num_lines == 1 then
        line_s = "line"
    else
        line_s = "lines"
    end

    local end_line = vim.fn.getline(vim.v.foldend)

    return {
        { prefix,                                         "Comment" },
        { start_line,                                     "Folded" },
        { ' ... (' .. num_lines .. ' ' .. line_s .. ') ', "Comment" },
        { end_line:gsub("^%s*", ""),                      "Folded" }
    }
end

vim.opt.foldtext = "v:lua.CustomFoldtext()"
vim.opt.fillchars:append({ fold = " " })

require("aerial").setup({
    show_guides = true,
    filter_kind = false,
    backends = {
        ["_"] = { "treesitter", "lsp", "markdown", "man" },
        yaml = { "lsp", "treesitter" },
        json = { "lsp", "treesitter" },
    },
    highlight_on_hover = true,
    autojump = true,
    manage_folds = false,
    link_tree_to_folds = true,
    link_folds_to_tree = true,
    close_automatic_events = { "unsupported" },
})

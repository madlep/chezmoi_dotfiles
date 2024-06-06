-- https://raw.githubusercontent.com/LunarVim/Neovim-from-scratch/05-completion/lua/user/cmp.lua
local cmp = require("cmp")



--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "󰅳",
    Method = "",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "󰫧",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "+",
    TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet
--

cmp.setup({
    -- snippet = {
    --     expand = function(args)
    --         vim.fn["vsnip#anonymous"](args.body)
    --     end,
    -- },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end
    },
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { "i", "c" }
        ),
        ["<M-y>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            { "i", "c" }
        ),


        ["<C-space>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function(
                _ --[[fallback]]
            )
                if cmp.visible() then
                    if not cmp.confirm { select = true } then
                        return
                    end
                else
                    cmp.complete()
                end
            end,
        },

        -- ["<tab>"] = false,
        ["<tab>"] = cmp.config.disable,

        -- Cody completion
        ["<c-a>"] = cmp.mapping.complete {
            config = {
                sources = {
                    { name = "cody" },
                },
            },
        },

        -- Testing
        ["<c-q>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
    },
    formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[NVIM_LUA]",
                -- luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = cmp.config.sources({
        { name = "path" },
        { name = "nvim_lsp",                keyword_length = 2 },
        { name = "nvim_lsp_signature_help", keyword_length = 3 },
        { name = "nvim_lua",                keyword_length = 3 },
        { name = "buffer",                  keyword_length = 3 },
        { name = "vsnip",                   keyword_length = 3 },
        { name = "calc",                    keyword_length = 3 },
        -- { name = "luasnip" },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
    },
})

-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ "/", "?" }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = "buffer" },
--     },
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = "path" },
--     }, {
--         { name = "cmdline" },
--     }),
-- })

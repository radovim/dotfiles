require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
        nvimtree = true,
        treesitter = true,
        coc_nvim = true,
        indent_blankline = {
            enabled = true,
            scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = false
        }
    }
})

require("github-theme").setup({
    options = {
        transparent = false,
        style = {
            theme = "dark_colorblind",
            functions = "italic",
            keyword = "italic",
            variable = "italic",
        },
        darken = {
            sidebars = {
                enable = true,
                list = { "qf", "vista_kind", "terminal", "packer" },
            },
        },
    },

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    palettes = { hint = "orange", error = "#ff0000" },
})

vim.cmd('colorscheme github_dark_high_contrast')

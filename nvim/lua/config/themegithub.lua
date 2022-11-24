require("github-theme").setup({
    theme_style = "dark_colorblind",
    transparent = true,
    function_style = "italic",
    keyword_style = "italic",
    variable_style = "italic",
    sidebars = { "qf", "vista_kind", "terminal", "packer" },

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    colors = { hint = "orange", error = "#ff0000" },

    -- Overwrite the highlight groups
    overrides = function(c)
        return {
            htmlTag = { fg = c.bright, sp = c.red },
            DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
            -- this will remove the highlight groups
            TSField = {},
        }
    end
})

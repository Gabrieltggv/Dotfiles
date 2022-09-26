require("bufferline").setup({
    options = {
        separator_style = "padded_slant", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = false,
    }
})

local map = vim.api.nvim_set_keymap
Options = { noremap = true }

map("n", "<Tab>", ":BufferLineCycleNext<cr>", Options)
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", Options)

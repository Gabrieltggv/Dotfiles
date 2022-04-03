require("bufferline").setup({
    options = {
        separator_style = "padded_slant", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = false,
        offsets = {{ filetype="NvimTree", text = "", padding = 0 }}
    }
})

local map = vim.api.nvim_set_keymap
mapOptions = { noremap = true }

map("n", "<Tab>", ":BufferLineCycleNext<cr>", mapOptions)
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", mapOptions)

local actions = require("telescope.actions")
local telescope = require("telescope")
telescope.setup({
    defaults = {
    selection_caret = '❯ ',
    entry_prefix = '  ',
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'horizontal',
    layout_config = { horizontal = { mirror = false }, vertical = { mirror = false } },
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    mappings = { i = { ['<esc>'] = actions.close, ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist } },
  },
})

telescope.load_extension("flutter")

local opts = { noremap = true }
local mappings = {
	{ "n", "<Leader>f", [[<Cmd>Telescope git_files<CR>]], opts },
	{ "n", "<Leader>G", [[<Cmd>Telescope git_status<CR>]], opts },
	{ "n", "<Leader>e", [[<Cmd>Telescope find_files<CR>]], opts },
	{ "n", "<Leader>b", [[<Cmd>Telescope buffers<CR>]], opts },
	{ "n", "<Leader>o", [[<Cmd>Telescope oldfiles<CR>]], opts },
	{ "n", "<Leader>/", [[<Cmd>Telescope live_grep<CR>]], opts },
	{ "n", "<Leader>m", [[<Cmd>Telescope keymaps<CR>]], opts },
}
for _, val in pairs(mappings) do
	vim.api.nvim_set_keymap(unpack(val))
end

local vim = vim

require('nvim-tree').setup({
  diagnostics = { enable = true },
  renderer = {
		highlight_opened_files = 'all',
		add_trailing = true,
        root_folder_modifier = ':p:~',
        group_empty = true,
  },
  open_on_tab = true,
  view = {
    width = 30,
    side = 'left',
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

-- Mappings
vim.api.nvim_set_keymap("n", "<Leader>nt", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

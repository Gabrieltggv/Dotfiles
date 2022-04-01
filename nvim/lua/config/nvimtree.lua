vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_highlight_opened_files = 1

vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_root_folder_modifier = ':p:~'

require('nvim-tree').setup({
  diagnostics = { enable = true },
  tab_open = true,
  auto_close = false,
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
      quit_on_open = false,
    },
  },
})

-- Mappings
vim.api.nvim_set_keymap("n", "<Leader>nt", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

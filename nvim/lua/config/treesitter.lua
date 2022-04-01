require('nvim-treesitter.configs').setup({
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<CR>',
      show_help = '?',
    },
  },
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    'lua',
    'yaml',
    'javascript',
    'python',
    'json',
    'markdown',
    'html',
  },
  autotag = {
        enable = true,
        filetypes = {
            'html',
            'vue',
        }
  },
  indent = { enable = true },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = '+',
      scope_incremental = 'w',
      node_decremental = '-',
    },
  },
})
local lsp_installer = require('nvim-lsp-installer')

local opts = {
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    on_attach = function(_, bufnr)
        require('config.lsp_func')

        local function buf_set_keymap(mode, l, r, opts)
            opts = opts or {}
            vim.api.nvim_buf_set_keymap(bufnr, mode, l, r, opts)
        end

        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap = true, silent = true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        -- stylua: ignore start
        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e', "<cmd>lua vim.diagnostic.show_line_diagnostics({float={border='rounded'}})<CR>",
            opts)
        buf_set_keymap('n', ']d', "<cmd>lua vim.diagnostic.goto_next({float={border='rounded'}})<CR>", opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
        buf_set_keymap('n', '<space>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        -- stylua: ignore end

        vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

        print('LSP Attached.')
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

-- Include the servers you want to have installed by default below
local servers = {
    'cssls',
    'kotlin_language_server',
    'tailwindcss',
    'gopls',
    'vuels',
    'ansiblels',
    'jsonls',
    'yamlls',
    'html',
    'emmet_ls',
    'pyright',
    'sumneko_lua',
    'dockerls',
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        print('Installing ' .. name)
        server:install()
    end
end


lsp_installer.on_server_ready(function(server)
    -- Specify the default options which we'll use to setup all servers
    local default_opts = opts
    server:setup(default_opts)
end)

-- Diagnostic icons
local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = '硫',
    Info = ' ',
}

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

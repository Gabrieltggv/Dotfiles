local null = require("null-ls")
local vim = vim


local sources = {
    null.builtins.code_actions.refactoring,
    null.builtins.completion.luasnip,
    null.builtins.diagnostics.buf,
    null.builtins.diagnostics.ansiblelint,
    null.builtins.diagnostics.curlylint,
    null.builtins.diagnostics.djlint,
    null.builtins.diagnostics.mypy,
    null.builtins.diagnostics.pylint,
    null.builtins.diagnostics.stylelint,
    null.builtins.formatting.black,
    null.builtins.formatting.dart_format,
    null.builtins.formatting.djlint,
    null.builtins.formatting.google_java_format,
    null.builtins.formatting.isort,
    null.builtins.formatting.jq,
    null.builtins.diagnostics.golangci_lint,
    null.builtins.formatting.ktlint,
    null.builtins.formatting.lua_format,
    null.builtins.formatting.prettierd,
    null.builtins.formatting.rustywind,
}

local augroup = vim.api.nvim_create_augroup("FormatOnSave", {})
null.setup({
    sources = sources,
    debug = true,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            print(client.supports_method("textDocument/formatting"))
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePost", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end
})


local mappings = {
    { "n", "<leader>af", vim.lsp.buf.formatting_sync },
    { "n", "<leader>ca", vim.lsp.buf.code_action },
}

for _, mapping in pairs(mappings) do
    vim.keymap.set(unpack(mapping))
end

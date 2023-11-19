require("typescript-tools").setup({
    on_attach = function(client, bufnr)
        if vim.fn.has("nvim-0.10") then
            -- Enable inlay hints
            vim.lsp.inlay_hint(bufnr, true)
        end
    end,
    settings = {
        separate_diagnostic_server = true,
        tsserver_file_preferences = {
            includeInlayParameterNameHints = 'all',
            includeCompletionsForModuleExports = true,
            quotePreference = 'auto',
        },
    }
})

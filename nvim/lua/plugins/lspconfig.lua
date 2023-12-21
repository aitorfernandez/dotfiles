vim.diagnostic.config({
    virtual_text = {
        source = "always",
    },
})

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    end
})

vim.g.cmptoggle = false

local cmp = require('cmp')
cmp.setup({
    enabled = function()
        return vim.g.cmptoggle
    end,
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ['<C-Space>'] = cmp.mapping.complete()
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help'},
        { name = 'path' },
        { name = 'vsnip' },
        { name = 'buffer' },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

vim.keymap.set('n', "<leader>'", '<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>', { desc = 'toggle nvim-cmp' })

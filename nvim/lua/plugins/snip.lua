local silent = { silent = true }

local ls = require('luasnip')
local vs = require('luasnip.loaders.from_vscode')

vs.lazy_load({
    include = {
        'css',
        'html',
        'javascript',
        'javascriptreact',
        'markdown',
        'rust',
        'sql',
        'typescript',
        'typescriptreact',
    },
})
vs.load({
    paths = '~/.config/nvim/friendly-snippets/' }
)

ls.filetype_extend('typescript', { 'javascript' })

vim.keymap.set({'i'}, '<C-s>', function() ls.expand() end, silent)
vim.keymap.set({'i', 's'}, '<C-j>', function() ls.jump( 1) end, silent)
vim.keymap.set({'i', 's'}, '<C-k>', function() ls.jump(-1) end, silent)

local function opts(desc)
    return { desc = 'fugitive: ' .. desc, noremap = true, silent = true, nowait = true }
end

vim.keymap.set('n', '<leader>gs', ':vert :Git<CR>', opts('Git'))

vim.g.fugitive_autoreload_status = 0

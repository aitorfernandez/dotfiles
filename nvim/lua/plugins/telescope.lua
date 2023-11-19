local telescope_builtin = require('telescope.builtin')

local function opts(desc)
    return { desc = 'telescope: ' .. desc, noremap = true, silent = true, nowait = true }
end

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, opts('Files'))
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, opts('Grep'))
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, opts('Buffers'))

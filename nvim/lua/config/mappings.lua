local keymap = vim.keymap.set

local silent = { silent = true }
local noremap = { noremap = true }
local noremap_silent = { noremap = true, silent = true }

keymap('n', '<plug>(NetrwUp)', ':E<CR>', noremap_silent)
if vim.fn.empty(vim.fn.maparg('-', 'n')) then
    keymap('n', '-', '<plug>(NetrwUp)', noremap_silent)
end

keymap('x', '>', '>gv', noremap_silent)
keymap('x', '<', '<gv', noremap_silent)

keymap('x', '<leader>y', '"+y', noremap_silent)
keymap('n', '<leader>p', '"+p', noremap_silent)

keymap('n', '<leader>/', ':nohlsearch<CR>', noremap_silent)

keymap('i', 'jk', '<Esc>', noremap)

keymap('n', '<leader>q', ':q<CR>', noremap_silent)
keymap('n', '<leader>w', ':w!<CR>', noremap_silent)

-- repeat in visual mode
keymap('x', '.', ':norm.<CR>', noremap_silent)

-- make J, K, L, and H move more the cursor
keymap('n', 'J', '}', noremap)
keymap('n', 'K', '{', noremap)
keymap('n', 'L', 'g_', noremap)
keymap('n', 'H', '^', noremap)

keymap('v', 'J', '}', noremap)
keymap('v', 'K', '{', noremap)
keymap('v', 'L', 'g_', noremap)
keymap('v', 'H', '^', noremap)

keymap('x', '<leader>s', ':sort i<CR>', noremap_silent)

keymap('n', '<C-]>', 'g<C-]>', noremap_silent)

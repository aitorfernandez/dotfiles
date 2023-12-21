local noremap_silent = { noremap = true, silent = true }

for i = 1, 9 do
    vim.api.nvim_set_keymap('n', '<leader>' .. i, ':' .. i .. 'tabnext<CR>', noremap_silent)
end

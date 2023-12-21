local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('config.plugins', {
    install = {
        colorscheme = { 'nord' },
    },
})

require('config.netrw')

require('config.options')
require('config.mappings')

require('config.tabs')

-- Turn off highlighting in insert mode, and turn it back on again when leaving
vim.api.nvim_exec([[
augroup highlight_search
    autocmd!
    autocmd InsertEnter * :setlocal nohlsearch
    autocmd InsertLeave * :setlocal hlsearch
augroup END
]], false)

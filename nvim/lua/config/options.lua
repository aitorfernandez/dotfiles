local options = {
    -- Line numbers
    number = true,
    relativenumber = true,

    -- Searching
    incsearch = true,
    hlsearch = true,
    smartcase = true,
    ignorecase = true,

    completeopt = 'menuone,noselect,noinsert',

    errorbells = false,

    expandtab = true,

    -- Fold
    foldcolumn = '0',
    foldnestmax = 0,
    foldlevel = 99,
    foldlevelstart = 99,

    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,

    -- Don't break words when wrapping text
    linebreak = true,

    -- Always show statusline
    laststatus = 2,
    display = lastline,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Autocompletion settings
-- . current buffer
-- w buffers from other windows
-- b buffers from the buffer list
-- u buffers that have been unloaded from the buffer list
-- t tag completion
vim.opt.complete = '.'
    .. ',w'
    .. ',b'
    .. ',u'
    .. ',t'
    .. ',kspell'

vim.fn.execute("let $v = $HOME.'/.config/nvim'")
-- set backup
vim.o.backupdir = vim.fn.expand('$v') .. '/tmp/backup/'
vim.o.directory = vim.fn.expand('$v') .. '/tmp/swap/'
vim.o.undodir = vim.fn.expand('$v') .. '/tmp/undo/'
vim.o.viewdir = vim.fn.expand('$v') .. '/tmp/view/'
vim.o.viminfo = "'1000,n$v/tmp/viminfo"

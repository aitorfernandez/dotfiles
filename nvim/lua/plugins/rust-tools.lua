require('rust-tools').setup({
    tools = {
        inlay_hints = {
            auto = true,
            only_current_line = true,
        },
    }
})

vim.g.rustfmt_autosave = 1
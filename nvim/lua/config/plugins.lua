return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/vim-vsnip',
        },
        config = function()
            require('plugins.cmp')
        end,
    },
    'hrsh7th/vim-vsnip-integ',
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins.lspconfig')
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins.telescope')
        end,
    },
    'rust-lang/rust.vim',
    {
        'simrat39/rust-tools.nvim',
        config = function()
            require('plugins.rust-tools')
        end,
    },
    {
        'tpope/vim-fugitive',
        config = function()
            require('plugins.fugitive')
        end,
    },
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        keys = {
          { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' },
        },
        config = function()
            require('plugins.mason')
        end,
    },
    'williamboman/mason-lspconfig.nvim',
    {
        'pmizio/typescript-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'neovim/nvim-lspconfig',
        },
        config = function()
            require('plugins.typescript-tools')
        end,
    },
    {
        'stevearc/conform.nvim',
        config = function()
            require('plugins.conform')
        end,
    },
    {
        'MunifTanjim/prettier.nvim',
        dependencies = { 'jose-elias-alvarez/null-ls.nvim' },
        config = function()
            require('plugins.prettier')
        end,
    },
    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        build = 'cd app && yarn install',
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { 'markdown' },
    },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = function()
            require('plugins.snip')
        end,
    },
    {
        'arcticicestudio/nord-vim',
        config = function()
            require('plugins.nord')
        end,
    }
}

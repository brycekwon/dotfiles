return {

    {
        'alexghergh/nvim-tmux-navigation',
        name = 'tmux-navigation',
        opts = {
            keybindings = {
                left = '<C-h>',
                right = '<C-l>',
                up = '<C-k>',
                down = '<C-j>',
            },
        },
    },

    {
        'folke/which-key.nvim',
        name = 'which-key',
        opts = {},
        event = "VeryLazy",
    },

    {
        'windwp/nvim-autopairs',
        name = 'autopairs',
        dependencies = {
            {
                "hrsh7th/nvim-cmp",
                name = 'nvim-cmp',
            },
        },
        config = function()
            require("nvim-autopairs").setup()
            require("cmp").event:on("confirm_done",
                require("nvim-autopairs.completion.cmp").on_confirm_done()
            )
        end,
    },

    {
        'windwp/nvim-ts-autotag',
        name = 'autotag',
        opts = {},
        ft = {
            'javascript',
            'typescript',
            'html',
        },
    },

}

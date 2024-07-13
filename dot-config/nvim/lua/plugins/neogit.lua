return {
    'neogitorg/neogit',
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
        },
        {
            'sindrets/diffview.nvim',
        },
        {
            'nvim-telescope/telescope.nvim',
        },
    },
    config = function()
        require('neogit').setup()
    end,
    keys = {
        { '<leader>gs', function() require('neogit').open() end, mode={'n', 'v'}, desc='Toggle neogit', noremap=true, silent=true },
    },
}

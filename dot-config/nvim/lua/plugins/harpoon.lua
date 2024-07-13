return {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
        },
    },
    keys = {
        { '<leader>aa', function() require('harpoon'):list():add() end, mode='n', desc='Add file to harpoon', noremap=true, silent=true },
        { '<leader>hh', function() local harpoon = require('harpoon') harpoon.ui:toggle_quick_menu(harpoon:list()) end, mode='n', desc='Toggle harpoon menu', noremap=true, silent=true },
        { '<leader>fh', '<CMD>Telescope harpoon marks<CR>', desc='Telescope harpoon', noremap=true, silent=true },
        { '<leader>1', function() require('harpoon'):list():select(1) end, mode='n', desc='Go to harpoon file #1', noremap=true, silent=true },
        { '<leader>2', function() require('harpoon'):list():select(2) end, mode='n', desc='Go to harpoon file #2', noremap=true, silent=true },
        { '<leader>3', function() require('harpoon'):list():select(3) end, mode='n', desc='Go to harpoon file #3', noremap=true, silent=true },
        { '<leader>4', function() require('harpoon'):list():select(4) end, mode='n', desc='Go to harpoon file #4', noremap=true, silent=true },
    }
}

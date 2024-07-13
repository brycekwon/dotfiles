return {
    'epwalsh/obsidian.nvim',
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
        },
    },
    opts = {
        workspaces = {
            {
                name = 'personal',
                path = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/personal',
            },
        },
    },
    keys = {
        { '<leader>of', '<CMD>ObsidianQuickSwitch<CR>', mode='n', noremap=true, silent=true },
        { '<leader>og', '<CMD>ObsidianSearch<CR>', mode='n', noremap=true, silent=true },
        { '<leader>od', '<CMD>ObsidianDailies<CR>', mode='n', noremap=true, silent=true },
        { '<leader>ot', '<CMD>ObsidianTags<CR>', mode='n', noremap=true, silent=true },
        { '<leader>oo', '<CMD>ObsidianOpen<CR>', mode='n', noremap=true, silent=true },
    },
}

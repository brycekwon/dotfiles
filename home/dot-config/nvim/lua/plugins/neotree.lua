return {
    'nvim-neo-tree/neo-tree.nvim',
    name = 'neotree',
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
            name = 'plenary',
        },
        {
            'nvim-tree/nvim-web-devicons',
            name = 'web-devicons',
        },
        {
            'muniftanjim/nui.nvim',
            name = 'nui',
        },
    },
    opts = {
        window = {
            width = 40,
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_by_name = {
                    '.git',
                },
                never_show = {
                    ".DS_Store",
                },
            },
        },
    },
    keys = {
        {
            '<leader>e', '<CMD>Neotree toggle<CR>', mode={'n', 'v'},
            desc='Toggle filetree', noremap=true, silent=true
        },
    },
}

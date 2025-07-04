return {
    'nvim-telescope/telescope.nvim',
    name = 'telescope',
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
            name = 'plenary',
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            name = 'telescope-fzf-native',
            build = 'make',
        },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                '%.bin', '%_%_pycache%_%_/*', '%.ipynb%_checkpoints/*', '%.log',
                '%.png', '%.jpg', '%.jpeg', '%.webp', '%.gif', '%.icns',
            },
        },
        pickers = {
            find_files = {
                find_command = {
                    'fd', '--hidden', '--type', 'file', '--type', 'symlink'
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
        },
    },
    keys = {
        { '<leader>ff', '<CMD>Telescope find_files<CR>', mode={'n', 'v'}, desc='Telescope find files', noremap=true, silent=true },
        { '<leader>fg', '<CMD>Telescope current_buffer_fuzzy_find<CR>', mode={'n', 'v'}, desc='Telescope search buffer', noremap=true, silent=true },
        { '<leader>fG', '<CMD>Telescope live_grep<CR>', mode={'n', 'v'}, desc='Telescope file grep', noremap=true, silent=true },
        { '<leader>fb', '<CMD>Telescope buffers<CR>', mode={'n', 'v'}, desc='Telescope buffers', noremap=true, silent=true },
        { '<leader>fd', '<CMD>Telescope diagnostics bufnr=0<CR>', mode={'n', 'v'}, desc='Telescope diagnostics', noremap=true, silent=true },
        { '<leader>fD', '<CMD>Telescope diagnostics<CR>', mode={'n', 'v'}, desc='Telescope diagnostics', noremap=true, silent=true },
    },
}

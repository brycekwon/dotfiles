return     {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                path_display = { 'filename_first' },
                mappings = {
                    i = {
                        ['<C-p>'] = actions.move_selection_previous,
                        ['<C-n>'] = actions.move_selection_next,
                    },
                },
                file_ignore_patterns = {
                    '%.png', '%.jpg', '%.jpeg', '%.webp', '%.gif', '%.pdf', '%.odt', '%.docx',
                    '%.ods', '%.xlsx', '%.pptx', '%.kdbx', '%.pcapng', '%.gpg', '%.kbx', '%.bin',
                },
            },
            pickers = {
                find_files = {
                    find_command = { 'fd', '--hidden', '--type', 'file' },
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
        })
        telescope.load_extension('fzf')
    end,
    keys = {
        { '<leader>ff', '<CMD>Telescope find_files<CR>', mode={'n', 'v'}, desc='Telescope find files', noremap=true, silent=true },
        { '<leader>fg', '<CMD>Telescope current_buffer_fuzzy_find<CR>', mode={'n', 'v'}, desc='Telescope search buffer', noremap=true, silent=true },
        { '<leader>fG', '<CMD>Telescope live_grep<CR>', mode={'n', 'v'}, desc='Telescope file grep', noremap=true, silent=true },
        { '<leader>fb', '<CMD>Telescope buffers<CR>', mode={'n', 'v'}, desc='Telescope buffers', noremap=true, silent=true },
        { '<leader>fd', '<CMD>Telescope diagnostics bufnr=0<CR>', mode={'n', 'v'}, desc='Telescope diagnostics', noremap=true, silent=true },
        { '<leader>fD', '<CMD>Telescope diagnostics<CR>', mode={'n', 'v'}, desc='Telescope diagnostics', noremap=true, silent=true },
        { '<leader>gb', '<CMD>Telescope git_branches<CR>', mode={'n', 'v'}, desc='Telescope git branches', noremap=true, silent=true },
        { '<leader>gh', '<CMD>Telescope git_commits<CR>', mode={'n', 'v'}, desc='Telescope git hashes', noremap=true, silent=true },
    },
}

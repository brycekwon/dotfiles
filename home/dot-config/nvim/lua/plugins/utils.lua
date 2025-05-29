--- Utility plugins

return {
    -- Tmux Navigator --
    -- Integration plugin for tmux-navigation for easy navigation keybinds.
    {
        'christoomey/vim-tmux-navigator',
        name = 'tmux-navigator',
        cmd = {
            'TmuxNavigateLeft',
            'TmuxNavigateDown',
            'TmuxNavigateUp',
            'TmuxNavigateRight',
            'TmuxNavigatePrevious',
            'TmuxNavigatorProcessList',
        },
        keys = {
            { '<C-h>', '<CMD>TmuxNavigateLeft<CR>' },
            { '<C-j>', '<CMD>TmuxNavigateDown<CR>' },
            { '<C-k>', '<CMD>TmuxNavigateUp<CR>' },
            { '<C-l>', '<CMD>TmuxNavigateRight<CR>' },
        },
    },

    -- Neovim Telescope Search --
    -- provides search functionality for file names and content.
    {
        'nvim-telescope/telescope.nvim',
        name = 'telescope',
        dependencies = {
            {
                'nvim-lua/plenary.nvim',
                name = 'plenary.nvim',
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
                    '%.docx', '%.ods', '%.xlsx', '%.pptx', '%.kdbx', '%.pcapng', '%.gpg',
                    '%.kbx', '%.bin', '%_%_pycache%_%_/*', '%.ipynb%_checkpoints/*', '%.log',
                    '%.png', '%.jpg', '%.jpeg', '%.webp', '%.gif', '%.icns', '%.pdf', '%.odt',
                },
            },
            pickers = {
                find_files = {
                    find_command = { 'fd', '--hidden', '--type', 'file', '--type', 'symlink' },
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
        config = function(_, opts)
            require('telescope').setup(opts)
            require('telescope').load_extension('fzf')
        end,
        keys = {
            { '<leader>ff', '<CMD>Telescope find_files<CR>', mode={'n', 'v'}, desc='Telescope find files', noremap=true, silent=true },
            { '<leader>fg', '<CMD>Telescope current_buffer_fuzzy_find<CR>', mode={'n', 'v'}, desc='Telescope search buffer', noremap=true, silent=true },
            { '<leader>fG', '<CMD>Telescope live_grep<CR>', mode={'n', 'v'}, desc='Telescope file grep', noremap=true, silent=true },
            { '<leader>fb', '<CMD>Telescope buffers<CR>', mode={'n', 'v'}, desc='Telescope buffers', noremap=true, silent=true },
            { '<leader>fd', '<CMD>Telescope diagnostics bufnr=0<CR>', mode={'n', 'v'}, desc='Telescope diagnostics', noremap=true, silent=true },
            { '<leader>fD', '<CMD>Telescope diagnostics<CR>', mode={'n', 'v'}, desc='Telescope diagnostics', noremap=true, silent=true },
        },
    },

    -- Undotree Neovim Undo Explorer --
    {
        'mbbill/undotree',
        name = 'undotree',
        init = function()
            vim.g.undotree_WindowLayout = 3
            vim.g.undotree_SplitWidth = 45
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
        keys = {
            { '<leader>u', vim.cmd.UndotreeToggle, mode={'n', 'v'}, desc='Toggle undotree', noremap=true, silent=true },
        },
    },
}

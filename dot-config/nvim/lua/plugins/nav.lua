--- NAV Plugins

return {

    -- Neotree Neovim File Explorer --
    -- serves as an alternative to the default Netrw provided by Neovim.
    {
        'nvim-neo-tree/neo-tree.nvim',
        name = 'neotree',
        dependencies = {
            {
                'nvim-lua/plenary.nvim',
                name = 'plenary.nvim',
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
                    '%.png', '%.jpg', '%.jpeg', '%.webp', '%.gif', '%.icns', '%.pdf', '%.odt',
                    '%.docx', '%.ods', '%.xlsx', '%.pptx', '%.kdbx', '%.pcapng', '%.gpg',
                    '%.kbx', '%.bin', '%_%_pycache%_%_/*', '%.ipynb%_checkpoints/*'
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

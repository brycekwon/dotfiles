--- Theme Plugins
--- this file contains plugins related to the look and feel of the editor, though it does contain
--- extra features that provides more functionality. they are placed on no particular order.

return {
    -- Catppuccin Neovim Colorscheme --
    -- provides the base colorscheme for the editor environment and third-party plugins.
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        opts = {
            custom_highlights = function(colors)
                return {
                    Comment = { fg = colors.flamingo },
                    TabLineSel = { bg = colors.pink },
                    CmpBorder = { fg = colors.surface2 },
                    Pmenu = { bg = colors.none },
                }
            end,
        },
        config = function(_, opts)
            require('catppuccin').setup(opts)

            -- set transparent background and foreground to match terminal theme
            vim.cmd([[
                augroup user_colors
                autocmd!
                autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
                autocmd ColorScheme * highlight NormalNC ctermbg=NONE guibg=NONE
                autocmd ColorScheme * highlight NormalFloat ctermbg=NONE guibg=NONE
                autocmd ColorScheme * highlight NormalFloatNC ctermbg=NONE guibg=NONE
                autocmd ColorScheme * highlight NeoTreeNormal ctermbg=NONE guibg=NONE
                autocmd ColorScheme * highlight NeoTreeNormalNC ctermbg=NONE guibg=NONE
                augroup END
            ]])

            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },

    -- Lualine Neovim Status Bar --
    -- provides a status bar at the bottom with information about the current environment.
    {
        'nvim-lualine/lualine.nvim',
        name = 'lualine',
        dependencies = {
            {
                'nvim-tree/nvim-web-devicons',
                name = 'web-devicons',
            },
        },
        opts = {
            options = {
                theme = 'catppuccin',
                component_separators = '',
                section_separators = {
                    left = '',
                    right = '',
                }
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '' }, right_padding = 2 }
                },
                lualine_b = { 'filename', 'branch' },
                lualine_c = {
                    '%=', { 'buffers' },
                },
                lualine_x = {
                    { 'diff' },
                    { 'diagnostics' },
                },
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        },
    },

    -- Indentation Markers --
    -- provides visual markers for indentation.
    {
        'lukas-reineke/indent-blankline.nvim',
        name = 'indent-blankline',
        main = 'ibl',
        opts = {},
        event = 'VeryLazy',
    },

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

    -- Treesitter Syntax Highlighting --
    -- provides general syntax highlighting for most languages and config files.
    {
        'nvim-treesitter/nvim-treesitter',
        name = 'treesitter',
        build = ':TSUpdate',
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-textobjects',
                name = 'treesitter-textobjects',
            },
        },
        opts = {
            ensure_installed = {
                'bash', 'comment', 'css', 'csv', 'diff', 'dockerfile', 'git_config', 'git_rebase',
                'gitattributes', 'gitcommit', 'gitignore', 'go', 'gomod', 'gosum', 'html',
                'javascript', 'json', 'make', 'python', 'regex', 'sql', 'ssh_config', 'tmux',
                'toml', 'typescript', 'xml', 'yaml',
            },
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<BS>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['a='] = { query='@assignment.outer', desc='Select outer part of assignment' },
                        ['i='] = { query='@assignment.inner', desc='Select inner part of assignment' },
                        ['l='] = { query='@assignment.lhs', desc='Select left hand side of assignment' },
                        ['r='] = { query='@assignment.rhs', desc='Select right hand side of assignment' },
                        ['ai'] = { query='@conditional.outer', desc='Select outer part of conditional' },
                        ['ii'] = { query='@conditional.inner', desc='Select inner part of conditional' },
                        ['al'] = { query='@loop.outer', desc='Select outer part of loop' },
                        ['il'] = { query='@loop.inner', desc='Select inner part of loop' },
                        ['af'] = { query='@call.outer', desc='Select outer part of function call' },
                        ['if'] = { query='@call.inner', desc='Select inner part of function call' },
                        ['am'] = { query='@function.outer', desc='Select outer part of function definition' },
                        ['im'] = { query='@function.inner', desc='Select inner part of function definition' },
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        [']i'] = { query='@conditional.outer', desc='Next conditional declaration start' },
                        [']l'] = { query='@loop.outer', desc='Next loop declaration start' },
                        [']f'] = { query='@call.outer', desc='Next function call start' },
                        [']m'] = { query='@function.outer', desc='Next function definition start' },
                    },
                    goto_next_end = {
                        [']I'] = { query='@conditional.outer', desc='Next conditional declaration end' },
                        [']L'] = { query='@loop.outer', desc='Next loop declaration end' },
                        [']F'] = { query='@call.outer', desc='Next function call end' },
                        [']M'] = { query='@function.outer', desc='Next function definition end' },
                    },
                    goto_previous_start = {
                        ['[i'] = { query='@conditional.outer', desc='Previous conditional declaration start' },
                        ['[l'] = { query='@loop.outer', desc='Previous loop declaration start' },
                        ['[f'] = { query='@call.outer', desc='Previous function call start' },
                        ['[m'] = { query='@function.outer', desc='Previous function definition start' },
                    },
                    goto_previous_end = {
                        ['[I'] = { query='@conditional.outer', desc='Previous conditional declaration end' },
                        ['[L'] = { query='@loop.outer', desc='Previous loop declaration end' },
                        ['[F'] = { query='@call.outer', desc='Previous function call end' },
                        ['[M'] = { query='@function.outer', desc='Previous function definition end' },
                    },
                },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)

            local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')
            vim.keymap.set({'n', 'x', 'o', 'v'}, ';', ts_repeat_move.repeat_last_move, { desc = 'Repeat last move', noremap = true, silent = true })
            vim.keymap.set({'n', 'x', 'o', 'v'}, ',', ts_repeat_move.repeat_last_move_opposite, { desc = 'Repeat opposite last move', noremap = true, silent = true })
        end
    },
    
    -- Git Markers --
    -- provides visual markers for git related changes and useful keymaps for staging blames.
    {
        'lewis6991/gitsigns.nvim',
        name = 'gitsigns',
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                map('n', ']g', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end, { desc = 'Next git hunk', noremap = true, silent = true })

                map('n', '[g', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end, { desc = 'Previous git hunk', noremap = true, silent = true })

                map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage git hunk', noremap = true, silent = true })
                map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset git hunk', noremap = true, silent = true })
                map('v', '<leader>gs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage git hunk', noremap = true, silent = true })
                map('v', '<leader>gr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset git hunk', noremap = true, silent = true })
                map({'n', 'v'}, '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Unstage git hunk', noremap = true, silent = true })
                map({'n', 'v'}, '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line blame', noremap = true, silent = true })
            end
        },
        event = 'VeryLazy',
    },
}

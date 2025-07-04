return {
    'nvim-treesitter/nvim-treesitter',
    name = 'treesitter',
    dependencies = {
        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            name = 'treesitter-textobjects',
        },
    },
    lazy = false,
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            'bash', 'comment', 'css', 'dockerfile', 'gitattributes',
            'gitignore', 'go', 'gomod', 'gosum', 'gotmpl', 'html', 'javascript',
            'json', 'make', 'python', 'sql', 'toml', 'typescript', 'yaml',
        },
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
                init_selection = '<C-space>',
                node_incremental = '<C-space>',
                scope_incremental = false,
                node_decremental = '<BS>',
            },
        },
        auto_install = false,
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
    end
}

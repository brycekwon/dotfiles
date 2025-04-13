--- LSP plugins

return {
    {
        'neovim/nvim-lspconfig',
        name = 'nvim-lspconfig',
        dependencies = {
            {
                'hrsh7th/cmp-nvim-lsp',
                name = 'cmp-nvim-lsp',
            },
            {
                'williamboman/mason.nvim',
                name = 'mason',
            },
            {
                'williamboman/mason-lspconfig.nvim',
                name = 'mason-lspconfig',
            },
        },
        config = function()
            local lspconfig = require('lspconfig')
            local mason_lsp = require('mason-lspconfig')

            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = '✓',
                        package_pending = '➜',
                        package_uninstalled = '✗',
                    },
                },
            })

            mason_lsp.setup({
                ensure_installed = {
                    'bashls', 'cssls', 'gopls', 'html', 'marksman', 'lua_ls', 'ruff',
                    'ts_ls',
                },
            })

            local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
            for type, icon in pairs(signs) do
                local hl = 'DiagnosticSign' .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
            end

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            mason_lsp.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function()
                    local bufmap = function(mode, lhs, rhs)
                        local opts = { buffer = true, noremap = true, silent = true  }
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    bufmap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>')
                    bufmap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
                    bufmap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
                    bufmap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
                    bufmap('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>')
                    bufmap('n', 'gl', '<CMD>lua vim.diagnostic.open_float()<CR>')
                    bufmap('n', '[d', '<CMD>lua vim.diagnostic.goto_prev()<CR>')
                    bufmap('n', ']d', '<CMD>lua vim.diagnostic.goto_next()<CR>')
                    bufmap("n", "<leader>rs", ":LspRestart<CR>")
                end
            })
        end,
    },

    {
        'hrsh7th/nvim-cmp',
        name = 'nvim-cmp',
        dependencies = {
            {
                'hrsh7th/cmp-path',
                name = 'cmp-path',
            },
            {
                'hrsh7th/cmp-buffer',
                name = 'cmp-buffer',
            },
            {
                'hrsh7th/cmp-cmdline',
                name = 'cmp-cmdline',
            },
            {
                'L3MON4D3/LuaSnip',
                name = 'luasnip',
                build = 'make install_jsregexp',
            },
            {
                'onsails/lspkind.nvim',
                name = 'lspkind',
            },
        },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()

            local cmp = require('cmp')
            cmp.setup({
                completion = {
                    completeopt = 'menu,menuone,preview,noselect',
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = 'nvim_lsp', keyword_length = 2 },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer', keyword_length = 0, max_item_count = 0, is_buffer = false },
                    { name = 'path', keyword_length = 1 },
                },
                window = {
                    documentation = cmp.config.window.bordered(),
                    completion = cmp.config.window.bordered(),
                },
                formatting = {
                    fields = {'menu', 'abbr', 'kind'},
                    format = require('lspkind').cmp_format({
                        maxwdith = 50,
                        ellipsis_char = '...',
                    }),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
                    ['<TAB>'] = cmp.mapping.select_next_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                }),
                cmp.setup.cmdline({ '/', '?' }, {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = 'buffer' }
                    }
                }),
                -- cmp.setup.cmdline(':', {
                --     mapping = cmp.mapping.preset.cmdline(),
                --     sources = cmp.config.sources({}, {
                --         {
                --             option = {
                --                 ignore_cmds = { 'Man', '!' }
                --             }
                --         }
                --     })
                -- })
            })

        end,
    },

    {
        'windwp/nvim-autopairs',
        name = 'autopairs',
        dependencies = {
            {
                "hrsh7th/nvim-cmp",
                name = 'nvim-cmp',
            },
        },
        config = function()
            require("nvim-autopairs").setup()
            require("cmp").event:on("confirm_done",
                require("nvim-autopairs.completion.cmp").on_confirm_done()
            )
        end,
    },

    {
        'windwp/nvim-ts-autotag',
        name = 'autotag',
        opts = {},
        ft = {
            'javascript',
            'typescript',
            'html',
        },
    },
}

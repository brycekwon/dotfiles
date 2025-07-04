return {
    'mason-org/mason-lspconfig.nvim',
    name = 'mason-lspconfig',
    dependencies = {
        {
            'mason-org/mason.nvim',
            name = 'mason',
            opts = {},
        },
        {
            'hrsh7th/nvim-cmp',
            name = 'nvim-cmp',
            dependencies = {
                {
                    'hrsh7th/cmp-nvim-lsp',
                    name = 'cmp-lspconfig',
                },
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
                    'onsails/lspkind.nvim',
                    name = 'lspkind',
                },
            },
            config = function()
                local cmp = require('cmp')
                cmp.setup({
                    completion = {
                        completeopt = 'menu,menuone,preview,noselect',
                    },
                    sources = {
                        { name = 'nvim_lsp', keyword_length = 2 },
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
                    cmp.setup.cmdline(':', {
                        mapping = cmp.mapping.preset.cmdline(),
                        sources = cmp.config.sources({}, {
                            {
                                option = {
                                    ignore_cmds = { 'Man', '!' }
                                }
                            }
                        })
                    })
                })
            end
        },
        'neovim/nvim-lspconfig',
    },
    opts = {
        ensure_installed = {
            'bashls', 'cssls', 'gopls', 'html', 'marksman', 'lua_ls', 'ruff',
            'ts_ls',
        },
    },
    config = function(_, opts)
        require('mason-lspconfig').setup(opts)

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- local on_attach = require("lspconfig").on_attach
        for _, server in ipairs(require('mason-lspconfig').get_installed_servers()) do
            if server == 'gopls' then
                vim.lsp.config(server, {
                    -- on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        gopls = {
                            completeUnimported = true,
                            staticcheck = true,
                            gofumpt = true,
                            analysis = {
                                unusedparams = true,
                            }
                        },
                    },
                })
            else
                vim.lsp.config(server, {
                    -- on_attach = on_attach,
                    capabilities = capabilities,
                })
            end
        end
    end
}

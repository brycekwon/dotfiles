return {
    'neovim/nvim-lspconfig',
    dependencies = {
        {
            'hrsh7th/cmp-nvim-lsp',
        },
        {
            'williamboman/mason-lspconfig.nvim',
        },
    },
    config = function()
        local lspconfig = require('lspconfig')
        local mason_lsp = require('mason-lspconfig')

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

            lspconfig['lua_ls'].setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                                [vim.fn.stdpath('config') .. '/lua'] = true,
                            },
                        },
                    },
                    telemetry = { enable = false },
                },
            }),
        })
    end,
    event = { 'BufReadPre', 'BufNewFile' },
}

return {
    'folke/noice.nvim',
    dependencies = {
        {
            'MunifTanjim/nui.nvim',
        },
        {
            'rcarriga/nvim-notify',
            opts = {
                stages = 'fade',
                timeout = 100,
                size = 20,
            },
            config = function()
                require('notify').setup({
                    background_colour = "#000000",
                    render = 'wrapped-compact',
                    max_width = 80,
                    stages = 'fade',
                    timeout = 100,
                })
            end,
        },
    },
    config = function()
        require('noice').setup({
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = '50%',
                    },
                    size = {
                        width = 60,
                        height = 'auto',
                    },
                },
                popupmenu = {
                    relative = 'editor',
                    position = {
                        row = 8,
                        col = '25%',
                    },
                    size = {
                        width = 25,
                        height = 10,
                    },
                    border = {
                        style = 'rounded',
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = {
                            Normal = 'Normal',
                            FloatBorder = 'DiagnosticInfo'
                        },
                    },
                },
            },
        })
        vim.keymap.set({'n'}, '<space><space>', '<CMD>Noice dismiss<CR>', { noremap=true, silent=true })
    end,
    event = 'VeryLazy',
}

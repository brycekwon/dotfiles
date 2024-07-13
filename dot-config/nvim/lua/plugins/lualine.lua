return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        {
            'nvim-tree/nvim-web-devicons',
            dependencies = {
                {
                    'rachartier/tiny-devicons-auto-colors.nvim',
                    config = function ()
                        require('tiny-devicons-auto-colors').setup({
                            colors = require("catppuccin.palettes").get_palette("mocha"),
                        })
                    end,
                    event = "VeryLazy",
                },
            },
        },
    },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'catppuccin',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = {
                    { 'mode' },
                },
                lualine_b = {
                    { 'location' },
                    { 'progress' },
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                    },
                },
                lualine_c = {
                    { 'buffers' },
                },
                lualine_x = {
                    { 'diff' },
                    { 'diagnostics' },
                },
                lualine_y = {
                    { 'branch' },
                    { 'filetype' },
                },
                lualine_z = {
                }
            }
        })
    end,
    event = 'VeryLazy',
}

return {
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
            component_separators = '',
            section_separators = {
                left = '',
                right = '',
            }
        },
        sections = {
            lualine_a = {
                { 'mode', separator={ left = '' }, right_padding=2 }
            },
            lualine_b = { 'location', 'progress', 'diagnostics' },
            lualine_c = { 'buffers'},
            lualine_x = { },
            lualine_y = { 'branch' },
            lualine_z = {
                {'filetype', separator={ right = '' }, left_padding=2 },
            },
        },
        inactive_sections = {
            lualine_a = {
                {  separator={ left = '' }, right_padding=2 }
            },
            lualine_b = { 'location', 'progress', 'diagnostics' },
            lualine_c = { 'buffers'},
            lualine_x = { },
            lualine_y = { 'branch' },
            lualine_z = {
                {'filetype', separator={ right = '' }, left_padding=2 },
            },
        },
    },
}

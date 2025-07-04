return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
        flavour = 'macchiato',
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd([[
            augroup user_colors
            autocmd!
            autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
            autocmd ColorScheme * highlight NormalNC ctermbg=NONE guibg=NONE
            autocmd ColorScheme * highlight NormalFloat ctermbg=NONE guibg=NONE
            autocmd ColorScheme * highlight NormalFloatNC ctermbg=NONE guibg=NONE
            autocmd ColorScheme * highlight NeoTreeNormal ctermbg=NONE guibg=NONE
            autocmd ColorScheme * highlight NeoTreeNormalNC ctermbg=NONE guibg=NONE
            autocmd ColorScheme * highlight TabLine ctermbg=None guibg=None
            autocmd ColorScheme * highlight TabLineSel ctermbg=None guibg=None
            autocmd ColorScheme * highlight TabLineFill ctermbg=None guibg=None
            augroup END
        ]])
        vim.cmd([[colorscheme catppuccin]])
    end,
}

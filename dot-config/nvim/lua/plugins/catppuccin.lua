return {
    'catppuccin/nvim',
    config = function()
        require('catppuccin').setup()
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
        vim.cmd.colorscheme 'catppuccin-mocha'
    end,
    lazy = false,
}

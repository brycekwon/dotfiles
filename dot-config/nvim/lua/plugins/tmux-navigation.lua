return {
    'alexghergh/nvim-tmux-navigation',
    config = function()
        require('nvim-tmux-navigation').setup({
            keybindings = {
                left = '<C-h>',
                right = '<C-l>',
                up = '<C-k>',
                down = '<C-j>',
            },
        })
    end,
}

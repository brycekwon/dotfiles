return {
    'goolord/alpha-nvim',
    config = function()
        local dashboard = require('alpha.themes.dashboard')
        dashboard.section.buttons.val = {
            dashboard.button('SPC l l', '  Lazy Manager', '<CMD>Lazy<CR>'),
            dashboard.button('SPC m m', '  Mason Manager', '<CMD>Mason<CR>'),
        }
        require('alpha').setup(require'alpha.themes.dashboard'.config)
    end,
    lazy = false,
}

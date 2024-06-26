-- ensure lazy.nvim package manager is installed --
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=v10.24.3',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- import core modules --
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- import plugin modules --
require('lazy').setup('plugins')

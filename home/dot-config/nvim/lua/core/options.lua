vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = 'yes:1'
vim.opt.colorcolumn = '80,100'

vim.opt.scrolloff = 10

vim.opt.timeoutlen = 500

vim.opt.wrap = false

vim.opt.foldenable = false

-- set search behavior
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- set window behavior
vim.opt.splitright = true
vim.opt.splitbelow = true


-- set tab behavior --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- set whitespace behavior
vim.opt.list = true
vim.opt.listchars = { tab = '» ',  trail = '·', nbsp = '␣'}
vim.opt.fillchars = { eob = ' ' }

-- set default clipboard --
vim.opt.clipboard:append('unnamed')

-- enable undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'

-- disable backups and swapfiles
vim.opt.backup = false
vim.opt.swapfile = false

-- disable core functions handled by plugins
vim.g.loaded_netrw = 1              -- handled by neotree plugin
vim.g.loaded_netrwPlugin = 1        -- handled by neotree plugin
vim.opt.showmode = false            -- handled by lualine plugin

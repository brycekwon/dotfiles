vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = false

vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '100'

vim.opt.wrap = false
vim.opt.foldenable = false

vim.opt.inccommand = 'split'

-- set search behavior --
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

-- disable backups and swapfiles --
vim.opt.backup = false          -- handled by undotree plugin
vim.opt.swapfile = false        -- TBD: swaps causing some issues

-- set window behavior --
vim.opt.splitright = true
vim.opt.splitbelow = true

-- set tab behavior --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.fillchars = { eob = ' ' }

-- set default clipboard --
vim.opt.clipboard:append('unnamed')

-- enable undo history --
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'

-- set whitespace behavior --
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣'}

-- set lsp options --
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- disable core functions handled by plugins --
vim.g.loaded_netrw = 1              -- handled by neotree plugin
vim.g.loaded_netrwPlugin = 1        -- handled by neotree plugin
vim.opt.showmode = false            -- handled by lualine plugin

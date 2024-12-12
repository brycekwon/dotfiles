local g = vim.g
local opt = vim.opt


-- set terminal gui colors --
opt.termguicolors = true
g.have_nerd_font = true

-- set editor line numbers --
opt.number = true
opt.relativenumber = true

-- set editor cursor line --
opt.cursorline = false

-- set column visual options --
opt.signcolumn = 'yes'
opt.colorcolumn = '100'

-- set mouse functionality --
opt.mouse = 'a'

-- disable autowrapping and folding --
opt.wrap = false
opt.foldenable = true

-- set substitutions visual options --
vim.opt.inccommand = 'split'

-- set miscellaneous visual options --
opt.scrolloff = 10
opt.updatetime = 50
opt.timeoutlen = 300
opt.conceallevel = 2

-- disable backups and swapfiles --
opt.backup = false          -- handled by undotree plugin
opt.swapfile = false        -- TBD: swaps causing some issues

-- set window behavior --
opt.splitright = true
opt.splitbelow = true

-- set search behavior --
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- set tab behavior --
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.fillchars = { eob = ' ' }

-- set default clipboard --
opt.clipboard:append('unnamed')

-- enable undo history --
opt.undofile = true
opt.undodir = vim.fn.stdpath('data') .. '/undodir'

-- set whitespace behavior --
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣'}

-- set lsp options --
opt.completeopt = {'menu', 'menuone', 'noselect'}

-- disable core options handled by plugins --
g.loaded_netrw = 1              -- handled by neotree plugin
g.loaded_netrwPlugin = 1        -- handled by neotree plugin
opt.showmode = false            -- handled by lualine plugin

-- disable checks for providers --
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

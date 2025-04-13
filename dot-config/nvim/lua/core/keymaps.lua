-- set default leader keys (<SPACE>) --
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- map ESC to Ctrl-c --
vim.keymap.set('', '<ESC>', '<C-c>', { noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, 'QQ', '<CMD>q!<CR>', { noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, 'ZW', '<CMD>wa<CR>', { noremap=true, silent=true })

-- registers do not overwrite content --
vim.keymap.set({'n', 'v'}, 'x', '"_x', { noremap=true, silent=true })
vim.keymap.set({'v'}, 'd', '"_d', { noremap=true, silent=true })
vim.keymap.set({'n'}, 'dd', '"_dd', { noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, 'D', '"_D', { noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, 'p', '"0p', { noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, 'P', '"0P', { noremap=true, silent=true })

-- jump to start/end of line --
vim.keymap.set({'n', 'v'}, '2', '$', { noremap = true, silent=true })
vim.keymap.set({'n', 'v'}, '1', '^', { noremap = true, silent=true })

-- jump to diagnostic messages --
vim.keymap.set({'n'}, '[d', vim.diagnostic.goto_prev, { desc='Go to previous diagnostic message', noremap=true, silent=true })
vim.keymap.set({'n'}, ']d', vim.diagnostic.goto_next, { desc='Go to next diagnostic message', noremap=true, silent=true })

-- undo and redo changes --
vim.keymap.set({'n', 'v', 'i'}, '<C-u>', '<CMD>undo<CR>', { noremap = true, silent=true })
vim.keymap.set({'n', 'v', 'i'}, '<C-r>', '<CMD>redo<CR>', { noremap = true, silent=true })

-- move highlighted chunks shortcuts (from @ThePrimeagen) --
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc='Move visual block up', noremap=true, silent=true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc='Move visual block down', noremap=true, silent=true })

-- window management --
vim.keymap.set({'n', 'v'}, '<leader>s=', '<CMD>sp<CR>', { desc='Split window horizontally', noremap = true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>s-', '<CMD>vsp<CR>', { desc='Split window vertically', noremap = true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>sx', '<CMD>close<CR>', { desc='Close current window', noremap = true, silent=true })

-- buffer management --
vim.keymap.set({'n', 'v'}, '<C-n>', '<CMD>bnext<CR>', { desc='Go to next buffer', noremap = true, silent=true })
vim.keymap.set({'n', 'v'}, '<C-p>', '<CMD>bprevious<CR>', { desc='Go to previous buffer', noremap = true, silent=true })
vim.keymap.set({'n', 'v'}, '<C-q>', '<CMD>bdelete<CR>', { desc='Delete current buffer', noremap = true, silent=true })

-- tab management --
vim.keymap.set({'n', 'v'}, '<leader>to', '<CMD>tabnew<CR>', { desc='Create new tab', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>tx', '<CMD>tabclose<CR>', { desc='Close current tab', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>1', '<CMD>tabn1<CR>', { desc='Go to tab #1', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>2', '<CMD>tabn2<CR>', { desc='Go to tab #2', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>3', '<CMD>tabn3<CR>', { desc='Go to tab #3', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>4', '<CMD>tabn4<CR>', { desc='Go to tab #4', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>5', '<CMD>tabn5<CR>', { desc='Go to tab #5', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>6', '<CMD>tabn6<CR>', { desc='Go to tab #6', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>7', '<CMD>tabn7<CR>', { desc='Go to tab #7', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>8', '<CMD>tabn8<CR>', { desc='Go to tab #8', noremap=true, silent=true })
vim.keymap.set({'n', 'v'}, '<leader>9', '<CMD>tabn9<CR>', { desc='Go to tab #9', noremap=true, silent=true })

-- substitution shortcut --
vim.keymap.set({'n', 'v'}, 'S', ':s/', { desc='Substitution', noremap=true, silent=true })

-- disabled, unused, or remapped --
vim.keymap.set({'n', 'v'}, 's', '<Nop>')
vim.keymap.set({'n', 'v'}, '0', '<Nop>')
vim.keymap.set({'n', 'v'}, 'u', '<Nop>')
vim.keymap.set({'n', 'v'}, 'q', '<Nop>')
vim.keymap.set({'n', 'v'}, '$', '<Nop>')
vim.keymap.set({'n', 'v'}, '^', '<Nop>')

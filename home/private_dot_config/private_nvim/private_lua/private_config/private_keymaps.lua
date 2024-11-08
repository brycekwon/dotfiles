local g = vim.g
local keymap = vim.keymap


-- set default map leader --
g.mapleader = ' '
g.maplocalleader = ' '

keymap.set('', '<ESC>', '<C-c>', { noremap=true, silent=true })

-- set registers to not auto copy content --
keymap.set({'n', 'v'}, 'x', '"_x', { noremap=true, silent=true })
keymap.set({'v'}, 'd', '"_d', { noremap=true, silent=true })
keymap.set({'n'}, 'dd', '"_dd', { noremap=true, silent=true })
keymap.set({'n', 'v'}, 'D', '"_D', { noremap=true, silent=true })
keymap.set({'n', 'v'}, 'p', '"0p', { noremap=true, silent=true })
keymap.set({'n', 'v'}, 'P', '"0P', { noremap=true, silent=true })

-- jump to beginning and end of line --
keymap.set({'n', 'v'}, '2', '$', { noremap = true, silent=true })
keymap.set({'n', 'v'}, '1', '^', { noremap = true, silent=true })

-- jump to diagnostic messages --
keymap.set({'n'}, '[d', vim.diagnostic.goto_prev, { desc='Go to previous diagnostic message', noremap=true, silent=true })
keymap.set({'n'}, ']d', vim.diagnostic.goto_next, { desc='Go to next diagnostic message', noremap=true, silent=true })

-- undo and redo changes --
keymap.set({'n', 'v', 'i'}, '<C-u>', '<CMD>undo<CR>', { noremap = true, silent=true })
keymap.set({'n', 'v', 'i'}, '<C-r>', '<CMD>redo<CR>', { noremap = true, silent=true })

-- window management --
keymap.set({'n', 'v'}, '<leader>s=', '<CMD>sp<CR>', { desc='Split window horizontally', noremap = true, silent=true })
keymap.set({'n', 'v'}, '<leader>s-', '<CMD>vsp<CR>', { desc='Split window vertically', noremap = true, silent=true })
keymap.set({'n', 'v'}, '<leader>sx', '<CMD>close<CR>', { desc='Close current window', noremap = true, silent=true })
keymap.set({'n', 'v'}, '˙', '<C-w>5<', { noremap=true, silent=true })
keymap.set({'n', 'v'}, '¬', '<C-w>5>', { noremap=true, silent=true })
keymap.set({'n', 'v'}, '˚', '<C-W>+', { noremap=true, silent=true })
keymap.set({'n', 'v'}, '∆', '<C-W>-', { noremap=true, silent=true })

-- buffer management --
keymap.set({'n', 'v'}, '<C-n>', '<CMD>bnext<CR>')
keymap.set({'n', 'v'}, '<C-p>', '<CMD>bprevious<CR>')
keymap.set({'n', 'v'}, '<C-q>', '<CMD>bdelete<CR>')

-- tab management --
keymap.set({'n', 'v'}, '<leader>to', '<CMD>tabnew<CR>', { desc='Create new tab', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>tx', '<CMD>tabclose<CR>', { desc='Close current tab', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>1', '<CMD>tabn1<CR>', { desc='Go to tab #1', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>2', '<CMD>tabn2<CR>', { desc='Go to tab #2', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>3', '<CMD>tabn3<CR>', { desc='Go to tab #3', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>4', '<CMD>tabn4<CR>', { desc='Go to tab #4', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>5', '<CMD>tabn5<CR>', { desc='Go to tab #5', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>6', '<CMD>tabn6<CR>', { desc='Go to tab #6', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>7', '<CMD>tabn7<CR>', { desc='Go to tab #7', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>8', '<CMD>tabn8<CR>', { desc='Go to tab #8', noremap=true, silent=true })
keymap.set({'n', 'v'}, '<leader>9', '<CMD>tabn9<CR>', { desc='Go to tab #9', noremap=true, silent=true })

-- substitution shortcut --
keymap.set({'n', 'v'}, 'S', ':s/', { desc='Substitution', noremap=true, silent=true })

-- navigation shortcuts (from @ThePrimeagen) --
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc='Move visual block up', noremap=true, silent=true })
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc='Move visual block down', noremap=true, silent=true })

keymap.set('', '<LEFT>', 'h', { noremap=true, silent=true })
keymap.set('', '<RIGHT>', 'l', { noremap=true, silent=true })
keymap.set('', '<UP>', 'k', { noremap=true, silent=true })
keymap.set('', '<DOWN>', 'j', { noremap=true, silent=true })
keymap.set('', '<S-LEFT>', 'h', { noremap=true, silent=true })
keymap.set('', '<S-RIGHT>', 'l', { noremap=true, silent=true })
keymap.set('', '<S-UP>', 'k', { noremap=true, silent=true })
keymap.set('', '<S-DOWN>', 'j', { noremap=true, silent=true })
keymap.set('', '<C-LEFT>', 'b', { noremap=true, silent=true })
keymap.set('', '<C-RIGHT>', 'w', { noremap=true, silent=true })

-- disabled, unused, or remapped --
keymap.set({'n', 'v'}, 's', '<Nop>')
keymap.set({'n', 'v'}, '0', '<Nop>')
keymap.set({'n', 'v'}, 'u', '<Nop>')
keymap.set({'n', 'v'}, 'q', '<Nop>')
keymap.set({'n', 'v'}, '$', '<Nop>')
keymap.set({'n', 'v'}, '^', '<Nop>')

local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes:1"
vim.opt.colorcolumn = "80,100"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "•", extends = "›", precedes = "‹", nbsp = "␣" }
vim.opt.fillchars = { eob = " " }

-- redraw settings
opt.lazyredraw = false
opt.redrawtime = 10000

-- disable intro message on startup
opt.shortmess:append("I")

vim.opt.winbar = " "

-- session save options (minimal, focused sessions)
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

-- disable default ui elements (using statusline plugin instead)
opt.ruler = false
opt.showcmd = false
opt.showmode = false
opt.showtabline = 0

-- spell checking options
vim.opt.spell = false
vim.opt.spelllang = "en_us"
vim.opt.spellsuggest = "best,10"
vim.opt.spelloptions = "camel"
local spell_dir = vim.fn.stdpath("config") .. "/spell"
vim.opt.spellfile = spell_dir .. "/en.utf-8.add"
if vim.fn.isdirectory(spell_dir) == 0 then
  vim.fn.mkdir(spell_dir, "p")
end

-- window borders
opt.winborder = "rounded"

-- backspace behavior
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard = "unnamedplus"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- file handling
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- completion
opt.completeopt = "menu,menuone,noselect"

-- performance
opt.updatetime = 250
opt.timeoutlen = 300

-- disable unused language providers (performance)
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- disable unused built-in plugins (performance)
local disabled_builtins = {
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "tohtml",
    "logiPat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
    "matchparen",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "tutor",
    "rplugin",
    "synmenu",
    "optwin",
    "osc52",
    "compiler",
    "bugreport",
    "editorconfig",
}

for _, plugin in ipairs(disabled_builtins) do
    vim.g["loaded_" .. plugin] = 1
end

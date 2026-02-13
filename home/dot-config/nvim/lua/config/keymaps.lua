-- delete without overwriting default register
vim.keymap.set("n", "C", '"_C', { noremap = true, silent = true })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true })
vim.keymap.set("n", "S", '"_S', { noremap = true, silent = true })
vim.keymap.set("n", "X", '"_X', { noremap = true, silent = true })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "s", '"_s', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

-- navigation
vim.keymap.set({ "n", "v" }, "<Up>", "k", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<Down>", "j", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<Left>", "h", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<Right>", "l", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<S-Up>", "{", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<S-Down>", "}", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<S-Left>", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<S-Right>", "$", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "H", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "L", "$", { noremap = true, silent = true })

-- undo and redo changes
vim.keymap.set("n", "<C-u>", vim.cmd.undo, { noremap = true, silent = true })
vim.keymap.set("n", "<C-r>", vim.cmd.redo, { noremap = true, silent = true })

-- move highlighted chunks
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true, desc = "Vertical Split Window" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { noremap = true, silent = true, desc = "Horizontal Split Window" })
vim.keymap.set("n", "<leader>sx", "<C-w>c", { noremap = true, silent = true, desc = "Close Window" })

-- buffer management
vim.keymap.set("n", "<C-t>", "<CMD>enew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-x>", "<CMD>bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", "<CMD>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", "<CMD>bprevious<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "]s", "]s", { noremap = true, silent = true, desc = "next misspelling" })
vim.keymap.set("n", "[s", "[s", { noremap = true, silent = true, desc = "previous misspelling" })
vim.keymap.set("n", "z=", "z=", { noremap = true, silent = true, desc = "spelling suggestions" })
vim.keymap.set("n", "zg", "zg", { noremap = true, silent = true, desc = "add word to dictionary" })
vim.keymap.set("n", "zw", "zw", { noremap = true, silent = true, desc = "mark word as misspelled" })

-- disabled, unused, or remapped
vim.keymap.set({"n", "v"}, "s", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "0", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "u", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "q", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "$", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "^", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-a>", "<Nop>", { noremap = true, silent = true })

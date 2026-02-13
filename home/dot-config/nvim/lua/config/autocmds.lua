local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("GeneralSettings", { clear = true })


-- enable spell check and wrapping for text files
autocmd("FileType", {
  group = general,
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
    vim.opt_local.wrap = true
  end,
})

-- reload files on external changes
autocmd({ "FocusGained", "BufEnter" }, {
  group = general,
  command = "checktime",
})

-- trim trailing whitespace
autocmd("BufWritePre", {
    group = general,
    callback = function()
        local save = vim.fn.winsaveview()
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.winrestview(save)
    end,
})

-- remember cursor location
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local exclude = { "gitcommit", "gitrebase" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end

    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- change to tabs for golang
autocmd("FileType", {
  group = general,
  pattern = { "go", "make" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 0
  end,
})

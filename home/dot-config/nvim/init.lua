-- enable faster lua module loader
if vim.loader then vim.loader.enable() end

-- boostrap lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { output, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- set leader keys before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- load local configurations
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- setup lazy.nvim plugins
require("lazy").setup("plugins", {
    defaults = { lazy = true },

    install = { colorscheme = { "catppuccin" } },
    ui = { border = "rounded" },

    rocks = {
        enabled = false,  -- disable luarocks support
    },

    checker = { enabled = false },
    change_detection = { enabled = false },

    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true,
        rtp = {
            reset = true,
            paths = {},
            -- disable built-in Neovim plugins that are unused
            disabled_plugins = {
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
            },
        },
    },
})

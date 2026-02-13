return {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    version = "v0.*",
    build = ":TSUpdate",

    -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },

    opts = {
        ensure_installed = {
            -- Core config files
            "lua", "vim", "vimdoc",

            -- Python
            "python",

            -- JavaScript/Web
            "javascript", "typescript", "tsx", "html", "css", "json", "jsonc",

            -- Go
            "go", "gomod", "gosum", "gotmpl",

            -- SQL/Database
            "sql",

            -- Rust
            "rust",

            -- C/C++
            "c", "cpp",

            -- DevOps/Config
            "yaml", "toml",
            "gitignore", "gitattributes",
            "make", "dockerfile",

            -- Utilities
            "markdown", "markdown_inline",
            "latex", "bibtex",
            "bash",
        },

        auto_install = false,
        sync_install = false,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = function(lang, buf)
                local max_filesize = 10 * 1024 * 1024  -- 10 MB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
    },

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}

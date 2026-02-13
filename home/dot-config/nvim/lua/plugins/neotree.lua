return {
    "nvim-neo-tree/neo-tree.nvim",
    name = "neotree",
    version = "3.*",

    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            name = "plenary",
        },
        {
            "nvim-tree/nvim-web-devicons",
            name = "web-devicons",
        },
        {
            "MunifTanjim/nui.nvim",
            name = "nui",
        },
    },

    keys = {
        { "<leader>e", "<CMD>Neotree toggle<CR>", desc = "Toggle NeoTree" },
        { "<leader>E", "<CMD>Neotree focus<CR>", desc = "Focus NeoTree" },
    },

    config = function()
        require("neo-tree").setup({
            use_default_mappings = true,
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_diagnostics = true,

            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        "__pycache__",
                        "node_modules",
                        ".cache",
                    },
                    never_show = { ".DS_Store", "thumbs.db" },
                },
                follow_current_file = { enabled = true },
                group_empty_dirs = true,
                hijack_netrw_behavior = "open_default",
            },

            buffers = {
                follow_current_file = { enabled = true },
                group_empty_dirs = true,
            },

            enable_git_status = true,
            git_status = {
                symbols = {
                    added     = "+",
                    modified  = "~",
                    deleted   = "-",
                    renamed   = "➜",
                    untracked = "?",
                    ignored   = "◌",
                    unstaged  = "✗",
                    staged    = "✓",
                    conflict  = "",
                },
            },
        })
    end,
}

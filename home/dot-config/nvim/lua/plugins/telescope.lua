return {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    version = "0.2.*",

    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            name = "plenary",
        },

        {
            "nvim-telescope/telescope-fzf-native.nvim",
            name = "telescope-fzf",
            build = "make",
        },

    },

    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "find files" },
        { "<leader>fG", "<CMD>Telescope live_grep<CR>", desc = "live grep" },
        { "<leader>fg", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "grep current buffer" },
        { "<leader>fD", "<CMD>Telescope diagnostics<CR>", desc = "diagnostics (workspace)" },
        { "<leader>fd", "<CMD>Telescope diagnostics bufnr=0<CR>", desc = "diagnostics (buffer)" },
    },

    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                prompt_prefix = "🔍 ",
                selection_caret = " ",

                file_ignore_patterns = {
                    -- media
                    "%.png$", "%.jpg$", "%.jpeg$", "%.gif$", "%.ico$", "%.pdf$",

                    -- binaries
                    "%.class$", "%.jar$",

                    -- databases
                    "%.sqlite$", "%.sqlite3$", "%.db$",

                    -- compressed
                    "%.zip$", "%.tar%.gz$", "%.tar$", "%.gz$",
                },

                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },

                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                    width = 0.85,
                    height = 0.80,
                },

                history = false,

                mappings = {
                    i = {
                        ["<C-k>"] = actions.preview_scrolling_up,
                        ["<C-j>"] = actions.preview_scrolling_down,
                        ["<C-h>"] = actions.preview_scrolling_left,
                        ["<C-l>"] = actions.preview_scrolling_right,
                        ["<C-c>"] = actions.close,
                    },
                    n = {
                        ["q"] = actions.close,
                    },
                },
            },

            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
                },
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        require("telescope").load_extension("fzf")
    end,
}

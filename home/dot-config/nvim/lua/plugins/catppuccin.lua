return {
    "catppuccin/nvim",
    name = "catppuccin",
    version = "v1.*",

    lazy = false,
    priority = 1000,

    opts = {
        flavour = "macchiato",
        transparent_background = true,
        integrations = {
            treesitter = true,
            telescope = true,
            cmp = true,
            gitsigns = true,
            neotree = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "undercurl" },
                    hints = { "undercurl" },
                    warnings = { "undercurl" },
                    information = { "undercurl" },
                },
            },
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")

        -- clear backgrounds for true transparency
        -- local groups = {
        --     "Normal", "NormalNC", "NormalFloat", "NormalFloatNC",
        --     "NeoTreeNormal", "NeoTreeNormalNC",
        --     "TabLine", "TabLineSel", "TabLineFill",
        -- }
        --
        -- local function clear_bg()
        --     for _, group in ipairs(groups) do
        --         vim.api.nvim_set_hl(0, group, { bg = "none" })
        --     end
        -- end
        --
        -- clear_bg()
        --     vim.api.nvim_create_autocmd("ColorScheme", {
        --     group = vim.api.nvim_create_augroup("UserColors", { clear = true }),
        --     callback = clear_bg,
        -- })
    end,
}

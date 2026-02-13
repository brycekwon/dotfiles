return {
    "mbbill/undotree",
    name = "undotree",

    init = function()
        vim.g.undotree_WindowLayout = 3
        vim.g.undotree_SplitWidth = 45
        vim.g.undotree_SetFocusWhenToggle = 1
    end,

    keys = {
        { "<leader>u", vim.cmd.UndotreeToggle, desc="Toggle undotree" },
    },
}

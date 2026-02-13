return {
    "christoomey/vim-tmux-navigator",
    name = "tmux-navigator",

    lazy = true,  -- load on first key press

    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
    },
    keys = {
        { "<C-k>", "<CMD>TmuxNavigateUp<CR>", mode = { "n", "t" }, desc = "Navigate up to tmux" },
        { "<C-j>", "<CMD>TmuxNavigateDown<CR>", mode = { "n", "t" }, desc = "Navigate down to tmux" },
        { "<C-h>", "<CMD>TmuxNavigateLeft<CR>", mode = { "n", "t" }, desc = "Navigate left to tmux" },
        { "<C-l>", "<CMD>TmuxNavigateRight<CR>", mode = { "n", "t" }, desc = "Navigate right to tmux" },
    },
}

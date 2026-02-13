return {
    "nvim-mini/mini.pairs",
    name = "mini-pairs",
    version = "v0.*",

    event = "InsertEnter",

    opts = {
        modes = { insert = true, command = true, terminal = false },
        skip_next = [=[[%w%%%'"%[%"%.%`%$]]=],
        skip_ts = { "string" },
        skip_unbalanced = true,
        markdown = true,
    },
    config = function(_, opts)
        require("mini.pairs").setup(opts)
    end,
}

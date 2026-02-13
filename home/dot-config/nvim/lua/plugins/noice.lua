return {
    "folke/noice.nvim",
    name = "noice",
    version = "^4.10.0",

    dependencies = {
        {
            "MunifTanjim/nui.nvim",
            name = "nui"
        },
    },

    event = "VeryLazy",

    opts = {
        cmdline = { enabled = true, view = "cmdline_popup" },
        messages = { enabled = true },
        popupmenu = { enabled = true },
        notify = { enabled = false },
        lsp = {
            progress = { enabled = true },
            hover = { enabled = true },
            signature = { enabled = true },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = true,
        },
    },
}

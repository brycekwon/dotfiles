return {
    "folke/todo-comments.nvim",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
        },
    },
    config = function(_, opts)
        require('todo-comments').setup(opts)

        vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next()
        end, { desc="Next todo comment", noremap=true, silent=true })

        vim.keymap.set("n", "[t", function()
            require("todo-comments").jump_prev()
        end, { desc="Previous todo comment", noremap=true, silent=true })

        vim.keymap.set({'n', 'v'}, '<leader>ft', '<CMD>TodoTelescope<CR>', { noremap=true, silent=true} )
    end,
    event = 'VeryLazy',
}

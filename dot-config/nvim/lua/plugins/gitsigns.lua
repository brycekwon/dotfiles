return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()

        vim.keymap.set({'n', 'v'}, '<leader>hs', '<CMD>Gitsigns stage_hunk<CR>', { desc='Stage git hunk', noremap=true, silent=true })
        vim.keymap.set({'n', 'v'}, '<leader>hu', '<CMD>Gitsigns undo_stage_hunk<CR>', { desc='Unstage git hunk', noremap=true, silent=true })
        vim.keymap.set({'n', 'v'}, '<leader>hp', '<CMD>Gitsigns preview_hunk<CR>', { desc='Stage git hunk', noremap=true, silent=true })
    end,
}

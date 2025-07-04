return {
    'christoomey/vim-tmux-navigator',
    name = 'tmux-navigator',
    cmd = {
        'TmuxNavigateLeft',
        'TmuxNavigateDown',
        'TmuxNavigateUp',
        'TmuxNavigateRight',
        'TmuxNavigatePrevious',
        'TmuxNavigatorProcessList',
    },
    keys = {
        { '<C-h>', '<CMD>TmuxNavigateLeft<CR>' },
        { '<C-j>', '<CMD>TmuxNavigateDown<CR>' },
        { '<C-k>', '<CMD>TmuxNavigateUp<CR>' },
        { '<C-l>', '<CMD>TmuxNavigateRight<CR>' },
    },
}

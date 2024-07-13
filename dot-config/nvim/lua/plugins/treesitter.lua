return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'bash', 'c', 'cpp', 'css', 'diff', 'dockerfile', 'git_config', 'git_rebase',
                'gitattributes', 'gitcommit', 'gitignore', 'go', 'gomod', 'gosum', 'gpg', 'html',
                'javascript', 'jsdoc', 'json', 'latex', 'lua', 'luadoc', 'make', 'markdown',
                'markdown_inline', 'python', 'regex', 'requirements', 'scss', 'sql', 'ssh_config',
                'tmux', 'toml', 'typescript', 'vim', 'vimdoc', 'yaml',
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            auto_install = false,
            additional_vim_regex_highlighting = false,
        })
    end,
}

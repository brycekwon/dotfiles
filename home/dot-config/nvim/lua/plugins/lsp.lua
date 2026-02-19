return {
    "neovim/nvim-lspconfig",
    name = "lspconfig-nvim",
    version = "2.5.*",

    dependencies = {
        {
            "mason-org/mason.nvim",
            name = "mason",
            version = "^2.1.0",
        },
        {
            "mason-org/mason-lspconfig.nvim",
            name = "lspconfig-mason",
            version = "^2.1.0",
        },
        {
            "hrsh7th/nvim-cmp",
            name = "cmp",
            dependencies = {
                {
                    "hrsh7th/cmp-nvim-lsp",
                    name = "cmp-lsp",
                },
                {
                    "hrsh7th/cmp-path",
                    name = "cmp-path",
                },
                {
                    "hrsh7th/cmp-buffer",
                    name = "cmp-buffer",
                },
            },
        },
    },

    cmd = "Mason",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require("mason").setup({ ui = { border = "rounded" } })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local function setup_server(server_name, settings)
            vim.lsp.config(server_name, {
                capabilities = capabilities,
                settings = settings,
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { buffer = bufnr })
                    vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = bufnr })
                end,
            })
            vim.lsp.enable(server_name)
        end

        require("mason-lspconfig").setup({
            automatic_installation = false,
            ensure_installed = {
                -- python
                "pyright",      -- lsp + type checker
                "ruff",         -- linter

                -- javascript/typescript
                "ts_ls",            -- lsp + type checker
                -- "eslint-lsp",       -- linter

                -- golang
                -- "gopls",            -- lsp + type checker

                -- html/css
                -- "html-lsp",         -- lsp
                -- "css-lsp",          -- lsp

                -- Java
                "jdtls",

                -- C/C++
                -- "clangd",           -- lsp + type checker

                -- Rust
                -- "rust-analyzer",    -- lsp + type checker
            },

            handlers = {
                -- by default, enable with capabilities
                function(server_name)
                    setup_server(server_name)
                end,

                basedpyright = function()
                    setup_server("basedpyright", {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "standard",
                                autoImportCompletions = true,
                                useLibraryCodeForTypes = true,
                            }
                        }
                    })
                end,

                ts_ls = function()
                    setup_server("ts_ls", {
                        typescript = { completions = { completeFunctionCalls = true } },
                        javascript = { completions = { completeFunctionCalls = true } },
                    })
                end,

                gopls = function()
                    setup_server("gopls", {
                        gopls = {
                            completeUnimported = true,
                            staticcheck = true,
                            gofumpt = true,
                            analyses = {
                                unusedparams = true,
                                nilness = true,
                                unusedwrite = true,
                            },
                        },
                    })
                end,
            }
        })

        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "nvim_lsp", keyword_length = 2 },
                { name = "buffer", keyword_length = 2 },
                { name = "path", keyword_length = 2 },
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            experimental = {
                ghost_text = true,
            },

            mapping = cmp.mapping.preset.insert({
                ["<TAB>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-TAB>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
        })

    end
}

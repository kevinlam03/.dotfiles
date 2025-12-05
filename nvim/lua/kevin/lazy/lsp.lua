return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
        -- optional `vim.uv` typings for lazydev
        { "Bilal2453/luvit-meta", lazy = true },
        "mfussenegger/nvim-jdtls",
    },
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())
        local lspconfig = require("lspconfig")
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        local server_configs = {
            ts_ls = {},
            eslint = {},
            pylsp = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            disable = {
                                "missing-fields"
                            }
                        },
                    },
                },
            },
        }

        mason.setup()
        local mason_ensure_installed = vim.tbl_keys(server_configs or {})
        vim.list_extend(
            mason_ensure_installed,
            {
                -- place other packages you want to install but not configure with mason here
                -- e.g. language servers not configured with nvim-lspconfig, linters, formatters, etc.
                "jdtls",
            }
        )
        mason_tool_installer.setup({
            ensure_installed = mason_ensure_installed
        })
        mason_lspconfig.setup({
            handlers = {
                ['jdtls'] = function() end,
                function(server_name)
                    local server_config = server_configs[server_name] or {}
                    server_config.capabilities = vim.tbl_deep_extend(
                        "force",
                        capabilities,
                        server_config.capabilities or {}
                    )
                    lspconfig[server_name].setup(server_config)
                end
            },
        })

        local cmp_insert = { behavior = cmp.SelectBehavior.Insert }

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_insert),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_insert),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            })
        })

        -- Keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
                vim.keymap.set('n', 'gd', function()
                    vim.lsp.buf.definition()
                    vim.cmd('norm zt')
                end, { buffer = args.buf })
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })
                vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = args.buf })
                vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = args.buf })
                vim.keymap.set('n', '[d', function()
                    vim.diagnostic.jump({count = -1})
                    vim.cmd('norm zz')
                end, { buffer = args.buf })
                vim.keymap.set('n', ']d', function()
                    vim.diagnostic.jump({count = 1})
                    vim.cmd('norm zz')
                end, { buffer = args.buf })
                vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, { buffer = args.buf })
                vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, { buffer = args.buf })
                vim.keymap.set('n', '<leader><C-d>', function()
                    vim.diagnostic.setloclist()
                    vim.cmd('lopen')
                end)
                vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, { buffer = args.buf })
            end
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover,
            {
                border = "rounded",
            }
        )
    end
}
